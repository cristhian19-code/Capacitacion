import { Calendar } from 'primereact/calendar'
import { InputText } from 'primereact/inputtext'

import { useNavigate } from 'react-router-dom'

export const BodyInterno = () => {

    const navigate = useNavigate();

    const goToAdd = () => {
        navigate('/ingresar_interno')
    }

    return (
        <div className='p-5'>
            <table>
                <colgroup>
                    <col style={{ width: '30%' }} />
                    <col style={{ width: '70%' }} />
                </colgroup>
                <br />
                <tr>
                    <td>
                        <label htmlFor="per_objetivo" className='mr-2'>Personal Objetivo</label>
                    </td>
                    <td>
                        <InputText id='per_objetivo' className='p-inputtext-sm w-full' />
                    </td>
                </tr>
                <br />
                <tr>
                    <td>
                        <label htmlFor="fec_cierre" className='mr-2'>Fecha de cierre</label>
                    </td>
                    <td>
                        <Calendar id='fec_cierre' className='p-inputtext-sm w-6' showIcon />
                    </td>
                </tr>
                <br />
                <tr>
                    <td>
                        <label htmlFor="nom_cargo" className='mr-2'>Nombre del cargo</label>
                    </td>
                    <td>
                        <InputText disabled id='nom_cargo' className='p-inputtext-sm w-full' />
                    </td>
                </tr>
                <br />
                <tr>
                    <td>
                        <label htmlFor="des_cargo" className='mr-2'>Descripcion del Cargo</label>
                    </td>
                    <td>
                        <InputText disabled id='des_cargo' className='p-inputtext-sm w-full' />
                    </td>
                </tr>
                <br />
                <tr>
                    <td>
                        <label htmlFor="requisitos" className='mr-2'>Requisitos</label>
                    </td>
                    <td>
                        <InputText disabled id='requisitos' className='p-inputtext-sm w-full' />
                    </td>
                </tr>
            </table>
        </div>
    )
}
