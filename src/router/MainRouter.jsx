import { BrowserRouter, Route, Routes } from 'react-router-dom'
import { EditarEmpresaExterna } from '../pages/EditarEmpresaExterna'
import { IngresarCandidatoExterno } from '../pages/IngresarCandidatoExterno'
import { IngresarCandidatoInterno } from '../pages/IngresarCandidatoInterno'
import { Login } from '../pages/Login'
import { Menu } from '../pages/Menu'
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
                <Route path='/ingresar_externo' element={<IngresarCandidatoExterno />} />
                <Route path='/nuevo_candidato' element={<NuevoCandidato />} />
                <Route path='/editar_empresa_externa' element={<EditarEmpresaExterna />} />
                
                <Route path='/' element={<Menu/>} />
            </Routes>
        </BrowserRouter>
    )
}
