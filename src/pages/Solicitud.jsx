import { useNavigate } from 'react-router-dom'
import { useEffect, useState } from 'react';

import { InputText } from 'primereact/inputtext';
import { Calendar } from 'primereact/calendar';
import { Dropdown } from 'primereact/dropdown';
import { InputNumber } from 'primereact/inputnumber';
import { Button } from 'primereact/button'
import { AutoComplete } from 'primereact/autocomplete'

import { startGetConocimiento, startGetTiposCargo } from '../store/actions/items';

import { useDispatch, useSelector } from 'react-redux'
import { useInput } from '../hooks/useInput';


const initialState = {
    fec_solicitud: '',
    solicitante: '',
    id_cargo: '',
    area: '',
    codigo: '',
    descripcion_trabajo: '',
    responsabilidad: '',
    conocimientos: [],
    experiencia: '',
    num_vacantes: '',
    comentario: ''
}

export const Solicitud = () => {
    const navigate = useNavigate();
    const dispatch = useDispatch();

    const { onChange, value } = useInput(initialState)


    const { conocimientos, tipos_cargo } = useSelector(state => state.items);

    const [filterCargos, setFilterCargos] = useState(null)

    const [conocimiento,] = useState(null)

    useEffect(() => {
        dispatch(startGetConocimiento());
        dispatch(startGetTiposCargo());
    }, [])


    const onSaveSolicitud = (e) => {
        e.preventDefault();
    }


    const goToMenu = () => {
        navigate('/')
    }

    const onSelectConocimiento = (e) => {
        setConocimiento(e.value)
    }

    const onSearchTipoCargo = (e) => {
        const _cargos = tipos_cargo.filter(tipo_cargo => tipo_cargo.nombre_cargo.toLowerCase().includes(e.query.toLowerCase()))
        const _cargos_filtered = _cargos.map(cargo => ({
            label: cargo.nombre_cargo,
            value: cargo.id_cargo
        }))
        setFilterCargos(_cargos_filtered)
    }

    return (
        <div className="px-3 flex flex-column justify-content-center align-items-center">
            <h1 className='text-white mt-7'>Solicitud de Personal</h1>
            <form className='mt-3 bg-white text-black p-5 border-round mb-5' onSubmit={onSaveSolicitud} style={{ width: 750 }}>

                <colgroup>
                    <col style={{ width: '20%' }} />
                    <col style={{ width: '20%' }} />
                    <col style={{ width: '20%' }} />
                    <col style={{ width: '20%' }} />
                </colgroup>
                <table>
                    <tr>
                        <td>
                            <label htmlFor="fec_solicitud" className='mr-2'>Fecha Solicitud:</label>
                        </td>
                        <td>
                            <Calendar name="fec_solicitud" onChange={onChange} id='fec_solicitud' className='p-inputtext-sm' />
                        </td>
                        <td style={{ width: 40 }}></td>
                        <td>
                            <label htmlFor="solicitante" className='mr-2' disabled  >Solicitante:</label>
                        </td>
                        <td>
                            <InputText id='solicitante' className='p-inputtext-sm' />
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <label htmlFor="area" className='mr-2'>Area:</label>
                        </td>
                        <td>
                            <InputText id='area' className='p-inputtext-sm' disabled />
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td>
                            <label htmlFor="nom_cargo" className='mr-2'>Tipo de Cargo:</label>
                        </td>
                        <td>
                            <AutoComplete field="label" suggestions={filterCargos} completeMethod={onSearchTipoCargo} />
                        </td>
                        <td></td>
                        <td>
                            Codigo:
                        </td>
                        <td style={{ fontSize: 12 }}>
                            16
                        </td>
                    </tr>

                    <br />
                    <br />
                    <br />

                    <tr>
                        <td colSpan={2}>
                            Descripcion del Trabajo:
                        </td>
                        <td colSpan={3} style={{ fontSize: 12 }}>
                            Mantener bajo control los eventos en donde se esta solicitando
                        </td>
                    </tr>

                    <br />

                    <tr>
                        <td colSpan={2}>
                            Responsabilidades:
                        </td>
                        <td colSpan={3} style={{ fontSize: 12 }}>
                            <InputText onChange={onChange} className="p-inputtext-sm" />
                        </td>
                    </tr>

                    <br />

                    <tr>
                        <td colSpan={2}>
                            Conocimiento:
                        </td>
                        <td colSpan={3} style={{ fontSize: 12 }}>
                            <Dropdown value={conocimiento} options={conocimientos} onChange={onSelectConocimiento} />
                        </td>
                    </tr>
                    <br />

                    <tr>
                        <td colSpan={2}>
                            Experiencia:
                        </td>
                        <td colSpan={3} style={{ fontSize: 12 }}>
                            Contar con mas de <InputNumber id='comentario' className='p-inputtext-sm' /> año en puestos similares
                        </td>
                    </tr>

                    <br />

                    <tr>
                        <td colSpan={2}>
                            Numero de vacantes:
                        </td>
                        <td colSpan={3}>
                            <InputNumber min={0} className="p-inputtext-sm" />
                        </td>
                    </tr>
                    <br />

                    <tr>
                        <td colSpan={2}>
                            Comentario:
                        </td>
                        <td colSpan={3}>
                            <InputText id='comentario' className='p-inputtext-sm' />
                        </td>
                    </tr>
                </table>

                <div className='flex gap-4 justify-content-center mt-6 mb-3'>
                    <Button className='p-button-primary p-button-sm' icon="pi pi-save" label="Guardar" />
                    <Button className='p-button-primary p-button-sm' icon="pi pi-pencil" label="Editar" />
                    <Button className='p-button-primary p-button-sm' icon="pi pi-arrow-right" label="Siguiente" onClick={goToMenu} />
                </div>
            </form>
        </div>
    )
}
