import { useEffect, useState } from 'react'
import { useDispatch } from 'react-redux'
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import { Login } from '../pages/Login'

import { PrivateRoute } from './PrivateRouter'
import { PublicRoute } from './PublicRouter'

import { login } from '../store/actions/auth'

export const MainRouter = () => {
    const dispatch = useDispatch();
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const user = JSON.parse(localStorage.getItem('user'));
        dispatch(login(user))
        setLoading(false);
    }, [])

    if (loading) {
        return <p>Loading ...</p>
    }

    return (

        <BrowserRouter>
            <Routes>
                <Route path='/login' element={
                    <PublicRoute>
                        <Login />
                    </PublicRoute>
                } />

                <Route path='/*' element={
                    <PrivateRoute />
                } />
            </Routes>
        </BrowserRouter>
    )
}
