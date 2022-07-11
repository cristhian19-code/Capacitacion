import logo from '../assets/logo.png'
import { InputText } from 'primereact/inputtext'
import { Button } from 'primereact/button'
import { useNavigate } from 'react-router-dom'
import { useState } from 'react'
import { startLogin } from '../store/actions/auth'
import { useSelector, useDispatch } from 'react-redux'

export const Login = () => {
    const navigate = useNavigate();
    const dispatch = useDispatch();
    const { user } = useSelector(state => state.auth);


    const [login, setLogin] = useState({
        email: '',
        password: ''
    })

    const obSubmit = async (e) => {
        await handleLogin()
        //navigate('/')
    }

    const handleCorreo = (e) => {
        console.log(e.target.value)

        setLogin({
            ...login,
            email: e.target.value
        })
    }

    const handlePassword = (e) => {
        console.log(e.target.value)
        setLogin({
            ...login,
            password: e.target.value
        })
    }

    const handleLogin = async (e) => {
        e.preventDefault();
        dispatch(startLogin(login))
    }

    return (
        <div className='h-screen flex flex-column justify-content-center align-items-center'>
            <img src={logo} alt="" height={170} />
            <form onSubmit={handleLogin} style={{ width: '400px' }}>
                <div>
                    <h3 className='text-white'>
                        <i className="pi pi-user mr-2 text-xl font-bold" />
                        USUARIO
                    </h3>
                    <InputText onChange={handleCorreo} type="email" className="block p-inputtext-sm w-full " />
                </div>

                <div>
                    <h3 className='text-white mt-5'>
                        <i className="pi pi-lock mr-2 text-xl font-bold" />
                        CONTRASEÑA
                    </h3>
                    <InputText onChange={handlePassword} type="password" className="block p-inputtext-sm w-full" />
                </div>
                <p style={{ textAlign: 'end' }} className='text-xs font-bold text-white underline mt-3'>¿Olvidaste tu contraseña?</p>
                <Button type='submit' label='Iniciar Sesion' className='p-button-sm w-full mt-3 bg-black-alpha-90 border-0 border-black-alpha-90' />
            </form>
        </div >
    )
}
