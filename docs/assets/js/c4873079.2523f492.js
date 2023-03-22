"use strict";(self.webpackChunksyringe_docs=self.webpackChunksyringe_docs||[]).push([[778],{3905:(e,n,t)=>{t.d(n,{Zo:()=>p,kt:()=>m});var r=t(7294);function i(e,n,t){return n in e?Object.defineProperty(e,n,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[n]=t,e}function a(e,n){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);n&&(r=r.filter((function(n){return Object.getOwnPropertyDescriptor(e,n).enumerable}))),t.push.apply(t,r)}return t}function o(e){for(var n=1;n<arguments.length;n++){var t=null!=arguments[n]?arguments[n]:{};n%2?a(Object(t),!0).forEach((function(n){i(e,n,t[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):a(Object(t)).forEach((function(n){Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n))}))}return e}function s(e,n){if(null==e)return{};var t,r,i=function(e,n){if(null==e)return{};var t,r,i={},a=Object.keys(e);for(r=0;r<a.length;r++)t=a[r],n.indexOf(t)>=0||(i[t]=e[t]);return i}(e,n);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(r=0;r<a.length;r++)t=a[r],n.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(i[t]=e[t])}return i}var l=r.createContext({}),c=function(e){var n=r.useContext(l),t=n;return e&&(t="function"==typeof e?e(n):o(o({},n),e)),t},p=function(e){var n=c(e.components);return r.createElement(l.Provider,{value:n},e.children)},u="mdxType",g={inlineCode:"code",wrapper:function(e){var n=e.children;return r.createElement(r.Fragment,{},n)}},d=r.forwardRef((function(e,n){var t=e.components,i=e.mdxType,a=e.originalType,l=e.parentName,p=s(e,["components","mdxType","originalType","parentName"]),u=c(t),d=i,m=u["".concat(l,".").concat(d)]||u[d]||g[d]||a;return t?r.createElement(m,o(o({ref:n},p),{},{components:t})):r.createElement(m,o({ref:n},p))}));function m(e,n){var t=arguments,i=n&&n.mdxType;if("string"==typeof e||i){var a=t.length,o=new Array(a);o[0]=d;var s={};for(var l in n)hasOwnProperty.call(n,l)&&(s[l]=n[l]);s.originalType=e,s[u]="string"==typeof e?e:i,o[1]=s;for(var c=2;c<a;c++)o[c]=t[c];return r.createElement.apply(null,o)}return r.createElement.apply(null,t)}d.displayName="MDXCreateElement"},2641:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>l,contentTitle:()=>o,default:()=>g,frontMatter:()=>a,metadata:()=>s,toc:()=>c});var r=t(7462),i=(t(7294),t(3905));const a={sidebar_position:2,description:"Creating and managing syringe instances"},o="Containers",s={unversionedId:"Usage/containers",id:"Usage/containers",title:"Containers",description:"Creating and managing syringe instances",source:"@site/docs/Usage/containers.mdx",sourceDirName:"Usage",slug:"/Usage/containers",permalink:"/Syringe/docs/Usage/containers",draft:!1,editUrl:"https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/docs/Usage/containers.mdx",tags:[],version:"current",sidebarPosition:2,frontMatter:{sidebar_position:2,description:"Creating and managing syringe instances"},sidebar:"DocumentationSidebar",previous:{title:"Getting Started",permalink:"/Syringe/docs/Usage/first_steps"},next:{title:"Modules",permalink:"/Syringe/docs/Usage/modules"}},l={},c=[{value:"Creating a Container",id:"creating-a-container",level:2},{value:"Customising the Container",id:"customising-the-container",level:2},{value:"Adding a custom Logger",id:"adding-a-custom-logger",level:3}],p={toc:c},u="wrapper";function g(e){let{components:n,...t}=e;return(0,i.kt)(u,(0,r.Z)({},p,t,{components:n,mdxType:"MDXLayout"}),(0,i.kt)("h1",{id:"containers"},"Containers"),(0,i.kt)("p",null,"Syringe introduces an intuitive container DSL that makes container management a no-brainer."),(0,i.kt)("p",null,"The following functions are part of the application DSL:"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},(0,i.kt)("inlineCode",{parentName:"li"},"injectSyringe { }")," - Creates a global scope ",(0,i.kt)("inlineCode",{parentName:"li"},"Container")),(0,i.kt)("li",{parentName:"ul"},(0,i.kt)("inlineCode",{parentName:"li"},"syringeContainer { }")," - Creates a local scope ",(0,i.kt)("inlineCode",{parentName:"li"},"Container")),(0,i.kt)("li",{parentName:"ul"},(0,i.kt)("inlineCode",{parentName:"li"},"modules { }")," - Starts the module list for the enclosing ",(0,i.kt)("inlineCode",{parentName:"li"},"Container")),(0,i.kt)("li",{parentName:"ul"},(0,i.kt)("inlineCode",{parentName:"li"},"logger { }")," - Binds a custom logger function to the log output of this container")),(0,i.kt)("p",null,"Using the global scope initialiser allows the use of the free function DSL. Otherwise every operation needs to happen on a certain ",(0,i.kt)("inlineCode",{parentName:"p"},"Container"),". "),(0,i.kt)("p",null,"Usually, using the global scope is the preferred ",(0,i.kt)("em",{parentName:"p"},"and")," simpler way."),(0,i.kt)("admonition",{type:"success"},(0,i.kt)("p",{parentName:"admonition"},"Both variant are identical in functionality. The global scope is for DSL convenience only.")),(0,i.kt)("h2",{id:"creating-a-container"},"Creating a Container"),(0,i.kt)("p",null,"Containers can be created via the container DSL functions:"),(0,i.kt)("pre",null,(0,i.kt)("code",{parentName:"pre",className:"language-swift",metastring:'title="main.swift"',title:'"main.swift"'},"// Global\ninjectSyringe {\n    modules {\n        // Modules go here\n    }\n}\n\n// Local\nlet localApp = syringeContainer {\n    modules {\n        // Modules go here\n    }\n}\n")),(0,i.kt)("h2",{id:"customising-the-container"},"Customising the Container"),(0,i.kt)("p",null,"It is possible to customise the container to one's needs. The container DSL offers a number of additional parameters for customisation."),(0,i.kt)("h3",{id:"adding-a-custom-logger"},"Adding a custom Logger"),(0,i.kt)("p",null,"Every container can be passed a custom logger which receives logs from Syringe:"),(0,i.kt)("pre",null,(0,i.kt)("code",{parentName:"pre",className:"language-swift",metastring:'title="main.swift"',title:'"main.swift"'},'// Global\ninjectSyringe {\n    // highlight-start\n    logger { \n        print("Level: \\($0) Message: \\($1)")\n    }\n    // highlight-end\n    modules {\n        // Modules go here\n    }\n}\n')))}g.isMDXComponent=!0}}]);