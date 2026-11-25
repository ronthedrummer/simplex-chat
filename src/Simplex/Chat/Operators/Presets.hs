{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}

module Simplex.Chat.Operators.Presets where

import Data.List.NonEmpty (NonEmpty)
import qualified Data.List.NonEmpty as L
import Data.String (fromString)
import Simplex.Chat.Operators
import Simplex.Messaging.Agent.Env.SQLite (allRoles)
import Simplex.Messaging.Agent.Store.Entity
import Simplex.Messaging.Protocol (ProtocolType (..), SMPServer)

-- | Mithril (Oak Digital) — sole preset operator for this fork.
-- Operator tag stays OTSimplex ("simplex") for DB/protocol compatibility;
-- all user-facing names and hostnames are rebranded.
operatorMithril :: NewServerOperator
operatorMithril =
  ServerOperator
    { operatorId = DBNewEntity,
      operatorTag = Just OTSimplex,
      tradeName = "Mithril",
      legalName = Just "Oak Digital",
      serverDomains = ["oakendigital.com"],
      conditionsAcceptance = CARequired Nothing,
      enabled = True,
      smpRoles = allRoles,
      xftpRoles = allRoles
    }

-- Back-compat alias used by tests and older call sites.
operatorSimpleXChat :: NewServerOperator
operatorSimpleXChat = operatorMithril

-- | Placeholder certificate fingerprint for chat.oakendigital.com.
-- Replace with the real SMP/XFTP/NTF server fingerprint once the host is provisioned
-- (DNS for chat.oakendigital.com was not resolving at fork time).
oakFingerprint :: String
oakFingerprint = "hQWvjXQ3QyhCSu5LNyxW7AUiCM4EivfO-xWDt97PJ1U"

oakHost :: String
oakHost = "chat.oakendigital.com"

oakSMPURI :: String
oakSMPURI = "smp://" <> oakFingerprint <> "@" <> oakHost

oakXFTPURI :: String
oakXFTPURI = "xftp://" <> oakFingerprint <> "@" <> oakHost

oakNTFURI :: String
oakNTFURI = "ntf://" <> oakFingerprint <> "@" <> oakHost

-- Sole preset SMP server for short-link decoding and new connections.
allPresetServers :: NonEmpty SMPServer
allPresetServers = oakSMPServers_

mithrilSMPServers :: [NewUserServer 'PSMP]
mithrilSMPServers = map (presetServer' True) (L.toList oakSMPServers_)

-- Back-compat aliases
simplexChatSMPServers :: [NewUserServer 'PSMP]
simplexChatSMPServers = mithrilSMPServers

enabledSimplexChatSMPServers :: NonEmpty SMPServer
enabledSimplexChatSMPServers = oakSMPServers_

-- Kept non-empty for type compatibility; same host as enabled (no legacy public servers).
disabledSimplexChatSMPServers :: NonEmpty SMPServer
disabledSimplexChatSMPServers = oakSMPServers_

oakSMPServers_ :: NonEmpty SMPServer
oakSMPServers_ = [fromString oakSMPURI]

mithrilXFTPServers :: [NewUserServer 'PXFTP]
mithrilXFTPServers = [presetServer True oakXFTPURI]

-- No public chat relays in this private-network fork.
mithrilChatRelays :: [NewUserChatRelay]
mithrilChatRelays = []

simplexChatRelays :: [NewUserChatRelay]
simplexChatRelays = mithrilChatRelays

-- Flux presets removed — this fork only uses Oak Digital / Mithril servers.
-- Stubs remain so older imports compile; they are not included in defaultChatConfig.
operatorFlux :: NewServerOperator
operatorFlux =
  operatorMithril
    { tradeName = "UNUSED",
      legalName = Nothing,
      enabled = False,
      serverDomains = []
    }

fluxSMPServers :: [NewUserServer 'PSMP]
fluxSMPServers = []

fluxSMPServers_ :: NonEmpty SMPServer
fluxSMPServers_ = oakSMPServers_

fluxXFTPServers :: [NewUserServer 'PXFTP]
fluxXFTPServers = []
