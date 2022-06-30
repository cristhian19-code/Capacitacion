import { BrowserRouter, Route, Routes } from 'react-router-dom'
import { IngresarCandidatoInterno } from '../pages/IngresarCandidatoInterno'
import { Login } from '../pages/Login'
import { NuevoCandidato } from '../pages/NuevoCandidato'
import { Publicacion } from '../pages/Publicacion'
import { RevisionPerfil } from '../pages/RevisionPerfil'
import { Solicitud } from '../pages/Solicitud'

export const MainRouter = () => {
    return (
        <BrowserRouter>
            <Routes>
                <Route path='/login' element={<Login />} />
                <Route path='/solicitud' element={<Solicitud />} />
                <Route path='/revision_perfil' element={<RevisionPerfil />} />
                <Route path='/publicacion' element={<Publicacion />} />
                <Route path='/ingresar_interno' element={<IngresarCandidatoInterno />} />
                <Route path='/nuevo_candidato' element={<NuevoCandidato />} />
            </Routes>
        </BrowserRouter>
    )
}
