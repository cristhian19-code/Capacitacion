import logo from '../assets/logo.png'
import { InputText } from 'primereact/inputtext'
import { Button } from 'primereact/button'

export const Login = () => {

    const obSubmit = (e) => {
        e.preventDefault();
        alert('Enviando mensajes')
    }

    return (
        <div className='h-screen flex flex-column justify-content-center align-items-center'>
            <img src={logo} alt="" height={170} />
            <form onSubmit={obSubmit} style={{ width: '400px' }}>
                <div>
                    <h3 className='text-white'>
                        <i className="pi pi-user mr-2 text-xl font-bold" />
                        USUARIO
                    </h3>
                    <InputText type="email" className="block p-inputtext-sm w-full " />
                </div>

                <div>
                    <h3 className='text-white mt-5'>
                        <i className="pi pi-lock mr-2 text-xl font-bold" />
                        CONTRASEÑA
                    </h3>
                    <InputText type="password" className="block p-inputtext-sm w-full" />
                </div>
                <p style={{ textAlign: 'end' }} className='text-xs font-bold text-white underline mt-3'>¿Olvidaste tu contraseña?</p>
                <Button type='submit' label='Iniciar Sesion' className='p-button-sm w-full mt-3 bg-black-alpha-90 border-0 border-black-alpha-90' />
            </form>
        </div >
    )
}
