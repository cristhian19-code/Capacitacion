import { useSelector } from "react-redux"
import { Navigate, Route, Routes } from "react-router-dom"
import { Menu } from "../pages/Menu"
import { Publicacion } from "../pages/Publicacion"
import { Solicitud } from "../pages/Solicitud"



export const PrivateRoute = () => {
    const { user } = useSelector(state => state.auth)

    return (
        user ? (
            <Routes>
                <Route index element={<Menu />} />
                <Route path="solicitud" element={<Solicitud />} />
                <Route path="publicacion" element={<Publicacion />} />
            </Routes>
        ) : <Navigate to="/login" />
    )
}