import React from 'react'
import ReactDOM from 'react-dom/client'

import "primereact/resources/themes/saga-blue/theme.css";  //theme
import "primereact/resources/primereact.min.css";                  //core css
import "primeicons/primeicons.css";
import "primeflex/primeflex.min.css"

import "./styles/global.scss"
import { MainRouter } from './router/MainRouter';


ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <MainRouter />
  </React.StrictMode>
)
