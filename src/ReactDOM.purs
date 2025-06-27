module ReactDOM
  ( findDOMNode
  , createRoot
  , hydrateRoot
  , renderRoot
  , renderToStaticMarkup
  , renderToStaticMarkupImpl
  , renderToString
  , unmount
  , Root
  )
  where

import Prelude

import Data.Function.Uncurried (runFn1, Fn1)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import React (ReactElement, ReactComponent)
import Web.DOM.Element (Element)

data Root

createRoot :: Element -> Root
createRoot = runFn1 createRootImpl


-- | Render a React element in a document element. Returns Nothing for stateless components.
renderRoot
  :: Root
  -> ReactElement
  -> Effect Unit
renderRoot root el = runEffectFn2 renderRootImpl root el

-- | Same as `render`, but is used to hydrate a container whose HTML contents were rendered on the server.
hydrateRoot
  :: Element
  -> ReactElement
  -> Effect Root
hydrateRoot el rEl = runEffectFn2 hydrateRootImpl el rEl

-- | Removes a mounted React element in a document element.
-- | Returns true if it was unmounted, false otherwise.
unmount :: Root -> Effect Unit
unmount = runEffectFn1 unmountImpl

-- | Finds the DOM node rendered by the component.
findDOMNode :: ReactComponent -> Effect Element
findDOMNode = runEffectFn1 findDOMNodeImpl

-- | Render a React element as a string.
renderToString :: ReactElement -> String
renderToString = runFn1 renderToStringImpl

-- | Render a React element as static markup string without extra DOM attributes.
renderToStaticMarkup :: ReactElement -> String
renderToStaticMarkup = runFn1 renderToStaticMarkupImpl

foreign import createRootImpl :: Fn1 Element Root

foreign import renderRootImpl
  :: EffectFn2
       Root
       ReactElement
       Unit

foreign import hydrateRootImpl
  :: EffectFn2
       Element
       ReactElement
       Root

foreign import unmountImpl
  :: EffectFn1
       Root
       Unit


foreign import findDOMNodeImpl :: EffectFn1 ReactComponent Element

foreign import renderToStringImpl :: Fn1 ReactElement String

foreign import renderToStaticMarkupImpl :: Fn1 ReactElement String
