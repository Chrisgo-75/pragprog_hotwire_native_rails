/***
 * Excerpted from "Hotwire Native for Rails Developers",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material,
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose.
 * Visit https://pragprog.com/titles/jmnative for more book information.
***/
import*as e from"@hotwired/turbo";import{connectStreamSource as t,disconnectStreamSource as n}from"@hotwired/turbo";export{e as Turbo};let s;async function getConsumer(){return s||setConsumer(createConsumer().then(setConsumer))}function setConsumer(e){return s=e}async function createConsumer(){const{createConsumer:e}=await import("@rails/actioncable/src");return e()}async function subscribeTo(e,t){const{subscriptions:n}=await getConsumer();return n.create(e,t)}var o=Object.freeze(Object.defineProperty({__proto__:null,createConsumer:createConsumer,getConsumer:getConsumer,setConsumer:setConsumer,subscribeTo:subscribeTo},Symbol.toStringTag,{value:"Module"}));function walk(e){return e&&typeof e==="object"?e instanceof Date||e instanceof RegExp?e:Array.isArray(e)?e.map(walk):Object.keys(e).reduce((function(t,n){var s=n[0].toLowerCase()+n.slice(1).replace(/([A-Z]+)/g,(function(e,t){return"_"+t.toLowerCase()}));t[s]=walk(e[n]);return t}),{}):e}class TurboCableStreamSourceElement extends HTMLElement{async connectedCallback(){t(this);this.subscription=await subscribeTo(this.channel,{received:this.dispatchMessageEvent.bind(this),connected:this.subscriptionConnected.bind(this),disconnected:this.subscriptionDisconnected.bind(this)})}disconnectedCallback(){n(this);this.subscription&&this.subscription.unsubscribe()}dispatchMessageEvent(e){const t=new MessageEvent("message",{data:e});return this.dispatchEvent(t)}subscriptionConnected(){this.setAttribute("connected","")}subscriptionDisconnected(){this.removeAttribute("connected")}get channel(){const e=this.getAttribute("channel");const t=this.getAttribute("signed-stream-name");return{channel:e,signed_stream_name:t,...walk({...this.dataset})}}}customElements.get("turbo-cable-stream-source")===void 0&&customElements.define("turbo-cable-stream-source",TurboCableStreamSourceElement);function encodeMethodIntoRequestBody(e){if(e.target instanceof HTMLFormElement){const{target:t,detail:{fetchOptions:n}}=e;t.addEventListener("turbo:submit-start",(({detail:{formSubmission:{submitter:e}}})=>{const s=isBodyInit(n.body)?n.body:new URLSearchParams;const o=determineFetchMethod(e,s,t);if(!/get/i.test(o)){/post/i.test(o)?s.delete("_method"):s.set("_method",o);n.method="post"}}),{once:true})}}function determineFetchMethod(e,t,n){const s=determineFormMethod(e);const o=t.get("_method");const r=n.getAttribute("method")||"get";return typeof s=="string"?s:typeof o=="string"?o:r}function determineFormMethod(e){return e instanceof HTMLButtonElement||e instanceof HTMLInputElement?e.name==="_method"?e.value:e.hasAttribute("formmethod")?e.formMethod:null:null}function isBodyInit(e){return e instanceof FormData||e instanceof URLSearchParams}window.Turbo=e;addEventListener("turbo:before-fetch-request",encodeMethodIntoRequestBody);export{o as cable};

