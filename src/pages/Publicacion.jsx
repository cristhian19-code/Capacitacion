import { Button } from 'primereact/button'
import { Calendar } from 'primereact/calendar'
import { Checkbox } from 'primereact/checkbox'
import { InputText } from 'primereact/inputtext'
import { useState } from 'react'

export const Publicacion = () => {

    const [reclutamiento, setReclutamiento] = useState({
        name: 'interno',
        type: 'jefatura'
    })


    const onSelectReclutamiento = (e) => {
        setReclutamiento({
            ...reclutamiento,
            name: e.target.name,
        });
    }

    const onSelectTipo = (e) => {
        setReclutamiento({
            ...reclutamiento,
            type: e.target.name
        });
    }

    return (
        <div className='px-3 flex flex-column justify-content-center align-items-center'>
            <h2 className='text-white mt-7'>Tipo de Reclutamiento</h2>

            <form className='mt-3 bg-white text-black p-5 border-round mb-5' style={{ width: 750 }}>
                <div>
                    <div className="field-checkbox">
                        <Checkbox inputId="interno" name="interno" onChange={onSelectReclutamiento} checked={reclutamiento.name.indexOf('externo') == -1} />
                        <label htmlFor="interno">Reclutamiento Interno</label>
                    </div>
                    <div className="field-checkbox">
                        <Checkbox inputId="externo" name="externo" onChange={onSelectReclutamiento} checked={reclutamiento.name.indexOf('interno') == -1} />
                        <label htmlFor="externo">Reclutamiento Enterno</label>
                    </div>
                </div>

                {
                    reclutamiento.name.indexOf('interno') == -1 && (
                        <div className='pl-6'>
                            <div className="field-checkbox">
                                <Checkbox inputId="jefatura" name="jefatura" onChange={onSelectTipo} checked={reclutamiento.type.indexOf('empresa') == -1} />
                                <label htmlFor="jefatura">Jefatura de reclutamiento </label>
                            </div>
                            <div className="field-checkbox">
                                <Checkbox inputId="empresa" name="empresa" onChange={onSelectTipo} checked={reclutamiento.type.indexOf('jefatura') == -1} />
                                <label htmlFor="empresa">Empresa exterma</label>
                            </div>
                        </div>
                    )
                }

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
                                <Calendar id='fec_cierre' className='p-inputtext-sm w-6' />
                            </td>
                        </tr>
                        <br />
                        <tr>
                            <td>
                                <label htmlFor="nom_cargo" className='mr-2'>Nombre del cargo</label>
                            </td>
                            <td>
                                <InputText id='nom_cargo' className='p-inputtext-sm w-full' />
                            </td>
                        </tr>
                        <br />
                        <tr>
                            <td>
                                <label htmlFor="des_cargo" className='mr-2'>Descripcion del Cargo</label>
                            </td>
                            <td>
                                <InputText id='des_cargo' className='p-inputtext-sm w-full' />
                            </td>
                        </tr>
                        <br />
                        <tr>
                            <td>
                                <label htmlFor="requisitos" className='mr-2'>Requisitos</label>
                            </td>
                            <td>
                                <InputText id='requisitos' className='p-inputtext-sm w-full' />
                            </td>
                        </tr>
                        <br />
                        <tr>
                            <td>
                                <label htmlFor="ubicacion" className='mr-2'>Ubicacion</label>
                            </td>
                            <td>
                                <InputText id='ubicacion' className='p-inputtext-sm w-full' />
                            </td>
                        </tr>
                    </table>
                </div>
                <div className='flex gap-4 justify-content-center mt-6 mb-3'>
                    <Button className='p-button-primary p-button-sm' icon="pi pi-save" label="Guardar" />
                    <Button className='p-button-primary p-button-sm' icon="pi pi-pencil" label="Editar" />
                    <Button className='p-button-primary p-button-sm' icon="pi pi-arrow-right" label="Siguiente" />
                </div>
            </form>
        </div>
    )
}
