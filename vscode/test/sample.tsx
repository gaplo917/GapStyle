import React, { ReactElement } from 'react'
import styled from 'styled-components'
import { transformHtmlAstProps } from '../transformHtmlAstProps'
import { childrenOrUndefined, HTMLAstComponentProps } from '../helper'
import { GHtml } from './GHtml'

const Span = styled.span`
  &.token.comment,
  &.token.prolog,
  &.token.cdata {
    color: #808080;
  }
  
  &.token.delimiter,
  &.token.boolean,
  &.token.keyword,
  &.token.selector,
  &.token.important,
  &.token.atrule {
    font-weight: bold;
    color: #F92672;
  }
  
  &.token.operator,
  &.token.punctuation,
  &.token.attr-name {
    color: #a9b7c6;
  }
  
  &.token.tag,
  &.token.tag .punctuation,
  &.token.doctype,
  &.token.builtin {
    color: #e8bf6a;
  }
  
  &.token.entity,
  &.token.number,
  &.token.symbol {
    color: #AE81FF;
  }
  
  &.token.property {
    color: #CF8822;
  }
  
  &.token.constant {
    color: #4186F8;
  }
  
  &.token.variable {
    color: #CBAD96;
  }
  
  &.token.string,
  &.token.char {
    color: #E6DB74;
  }
  
  &.token.attr-value,
  &.token.attr-value .punctuation {
    color: #a5c261;
  }
  
  &.token.attr-value .punctuation:first-child {
    color: #a9b7c6;
  }
  
  &.token.url, 
  &.token.url-link, 
  &.token.email-link {
    color: #589DF6;
    text-decoration: underline;
  }
  
  &.token.function {
    color: #A6E22E;
  }
  
  &.token.regex {
    background: #364135;
  }
  
  &.token.bold {
    font-weight: bold;
  }
  
  &.token.italic {
    font-style: italic;
  }
  
  &.token.inserted {
    background: #294436;
  }
  
  &.token.deleted {
    background: #484a4a;
  }

`

const Code = styled.code`
  color: #CBAD96;
  background: #2C2C2C;
  font-family: Hack, Consolas, Menlo, Monaco, source-code-pro, 'Andale Mono', monospace;
  direction: ltr;
  font-feature-settings: normal;
  text-align: left;
  white-space: pre;
  word-spacing: normal;
  word-break: normal;
  word-wrap: normal;
  line-height: 1.5;
  margin-bottom: 0;
  tab-size: 4;
  hyphens: none;

  &.language-css .token.property,
  &.language-css .token.property + .token.punctuation {
    color: #89BB26;
  }
  
  &.language-css .token.id {
    color: #F92672;
  }
  
  &.language-css .token.selector > .token.class,
  &.language-css .token.selector > .token.attribute,
  &.language-css .token.selector > .token.pseudo-class,
  &.language-css .token.selector > .token.pseudo-element {
    color: #F92672;
  }

  .gatsby-highlight-code-line {
    background-color: rgba(33, 66, 131, 0.85);
    display: block;
    margin-right: -2rem;
    margin-left: -2rem;
    padding-right: 2rem;
    padding-left: 1.8rem;
    border-left: 0.2rem solid #F92672;
  }
  
  ${props => props.theme.mui.breakpoints.only('xs')} {
    .gatsby-highlight-code-line {
      margin-right: -32px;
      margin-left: -32px;
      padding-right: 32px;
      padding-left: 28px;
      border-left: 4px solid #F92672;
    }

  }
  
`

const Container = styled.div`
  margin-bottom: 1.75rem;
  margin-left: -24px;
  margin-right: -24px;
  background: #2C2C2C;
  -webkit-overflow-scrolling: touch;
  overflow: auto;
  font-size: 0.75rem; 

  ${props => props.theme.mui.breakpoints.only('xs')} {
    margin-left: -16px;
    margin-right: -16px;
   -webkit-text-size-adjust: none;
  }
  
  *::selection {
    color: inherit;
    background: rgba(33, 66, 131, 0.85);
  }
    
  &::-webkit-scrollbar {
    -webkit-appearance: none;
  }
  
  &::-webkit-scrollbar:horizontal {
    height: 11px;
  }
  
  &::-webkit-scrollbar-thumb {
      border-radius: 8px;
      border: 2px solid #000; /* should match background, can't be transparent */
      background-color: rgba(255, 255, 255, .5);
  }
  
  &::-webkit-scrollbar-track { 
      background-color: #000; 
      border-radius: 8px; 
  } 
`


const Pre = styled.pre`
  float: left;
  min-width: 100%;
  padding: 1rem 2rem;
  margin: 0 0 .5rem 0;
  overflow: auto;
  position: relative;

`

export function GStyleCode(props: HTMLAstComponentProps): ReactElement {
  const { ast } = props
  switch (ast.type) {
    case 'root':
      return <Container {...transformHtmlAstProps(ast.properties)}>{childrenOrUndefined(GStyleCode, ast.children)}</Container>
    case 'element':
      switch (ast.tagName) {
        case 'pre':
          return <Pre {...transformHtmlAstProps(ast.properties)}>{childrenOrUndefined(GStyleCode, ast.children)}</Pre>
        case 'span':
          return <Span {...transformHtmlAstProps(ast.properties)}>{childrenOrUndefined(GStyleCode, ast.children)}</Span>
        case 'code':
          return <Code {...transformHtmlAstProps(ast.properties)}>{childrenOrUndefined(GStyleCode, ast.children)}</Code>
        default:
          return <GHtml ast={ast}/>
      }

    case 'text':
      return <>{ast.value}</>

    default:
      throw new Error(`node: ${JSON.stringify(ast)} is not matched`)

  }
}
