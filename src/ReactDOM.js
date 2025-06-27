import ReactDOMClient from "react-dom/client";
import ReactDOMServer from "react-dom/server";

export function createRootImpl(element) {
  return ReactDOMClient.createRoot(element);
}

export function renderRootImpl(root, element) {
  return root.render(element);
}

export function hydrateRootImpl(container, element) {
  return ReactDOMClient.hydrateRoot(container, element);
}

export function unmountImpl(root) {
  return root.unmount();
}

export const findDOMNodeImpl = ReactDOMClient.findDOMNode;
export const renderToStringImpl = ReactDOMServer.renderToString;
export const renderToStaticMarkupImpl = ReactDOMServer.renderToStaticMarkup;
