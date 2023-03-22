"use strict";(self.webpackChunksyringe_docs=self.webpackChunksyringe_docs||[]).push([[418],{3905:(e,t,n)=>{n.d(t,{Zo:()=>u,kt:()=>m});var r=n(7294);function i(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function o(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function a(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?o(Object(n),!0).forEach((function(t){i(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):o(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function c(e,t){if(null==e)return{};var n,r,i=function(e,t){if(null==e)return{};var n,r,i={},o=Object.keys(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||(i[n]=e[n]);return i}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(i[n]=e[n])}return i}var s=r.createContext({}),l=function(e){var t=r.useContext(s),n=t;return e&&(n="function"==typeof e?e(t):a(a({},t),e)),n},u=function(e){var t=l(e.components);return r.createElement(s.Provider,{value:t},e.children)},p="mdxType",d={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},f=r.forwardRef((function(e,t){var n=e.components,i=e.mdxType,o=e.originalType,s=e.parentName,u=c(e,["components","mdxType","originalType","parentName"]),p=l(n),f=i,m=p["".concat(s,".").concat(f)]||p[f]||d[f]||o;return n?r.createElement(m,a(a({ref:t},u),{},{components:n})):r.createElement(m,a({ref:t},u))}));function m(e,t){var n=arguments,i=t&&t.mdxType;if("string"==typeof e||i){var o=n.length,a=new Array(o);a[0]=f;var c={};for(var s in t)hasOwnProperty.call(t,s)&&(c[s]=t[s]);c.originalType=e,c[p]="string"==typeof e?e:i,a[1]=c;for(var l=2;l<o;l++)a[l]=n[l];return r.createElement.apply(null,a)}return r.createElement.apply(null,n)}f.displayName="MDXCreateElement"},3917:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>s,contentTitle:()=>a,default:()=>d,frontMatter:()=>o,metadata:()=>c,toc:()=>l});var r=n(7462),i=(n(7294),n(3905));const o={sidebar_position:1},a="Introduction",c={unversionedId:"introduction",id:"version-0.1.1-a/introduction",title:"Introduction",description:"Syringe is a lightweight dependency(DI) framework written in Swift. It aims to provide an intuitive and non-invasive way to realise Inversion of Control(IoC) in applications written in Swift.",source:"@site/versioned_docs/version-0.1.1-a/introduction.mdx",sourceDirName:".",slug:"/introduction",permalink:"/Syringe/docs/introduction",draft:!1,editUrl:"https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/versioned_docs/version-0.1.1-a/introduction.mdx",tags:[],version:"0.1.1-a",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"DocumentationSidebar",next:{title:"Setup",permalink:"/Syringe/docs/setup"}},s={},l=[],u={toc:l},p="wrapper";function d(e){let{components:t,...n}=e;return(0,i.kt)(p,(0,r.Z)({},u,n,{components:t,mdxType:"MDXLayout"}),(0,i.kt)("h1",{id:"introduction"},"Introduction"),(0,i.kt)("p",null,"Syringe is a lightweight dependency(DI) framework written in Swift. It aims to provide an intuitive and non-invasive way to realise Inversion of Control(IoC) in applications written in Swift."),(0,i.kt)("p",null,"Unlike other dependency frameworks, Syringe aims for simplicity and ease-of-use via an extensive custom DSL. "),(0,i.kt)("p",null,"The core features of Syringe:"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Full-features dependency injection"),(0,i.kt)("li",{parentName:"ul"},"Intuitive and clever custom DSL"),(0,i.kt)("li",{parentName:"ul"},"Non-invasive:",(0,i.kt)("ul",{parentName:"li"},(0,i.kt)("li",{parentName:"ul"},"No property wrappers"),(0,i.kt)("li",{parentName:"ul"},"No code-generation"),(0,i.kt)("li",{parentName:"ul"},"Only use Syringe where you need to"))),(0,i.kt)("li",{parentName:"ul"},"Tested on macOS, Windows and Linux.")))}d.isMDXComponent=!0}}]);