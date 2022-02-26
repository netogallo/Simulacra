{-# LANGUAGE DataKinds #-}
module Simulacra.Matrix where

import Control.Monad.IO.Class (MonadIO(..))
import Data.Typeable (Proxy(..))
import Graphics.UI.QaTharina (collector, emitter, Channel, EffectM, Frequency, Query, QueryTypes(..), Signal, Slot)
import Network.Matrix.Client (createSession)

matrixEffect :: EffectM (Slot '[Channel Nothing '[Frequency "MatrixToken" String]]) (Signal '[Channel Nothing '[Frequency "Value" String]]) ()
matrixEffect = do
  roomList <- emitter (Proxy :: Proxy (Query (Indexed 0 "Value")))
  token <- collector (Proxy :: Proxy (Query (Indexed 0 "MatrixToken")))
  session <- liftIO $ createSession undefined undefined
  return ()
