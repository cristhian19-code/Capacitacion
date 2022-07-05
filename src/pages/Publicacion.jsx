import { useState } from 'react'

import { Button } from 'primereact/button'
import { Checkbox } from 'primereact/checkbox'

import { BodyInterno } from './components/BodyInterno'
import { BodyExterno } from './components/BodyExterno'

import { useNavigate } from 'react-router-dom'


export const Publicacion = () => {
    const navigate = useNavigate();

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

    const goToAdd = (tipo) => {
        navigate(`/ingresar_${tipo}`)
    }

    return (
        <div className='px-3 flex flex-column justify-content-center align-items-center'>
            <h2 className='text-white mt-7'>Tipo de Reclutamiento</h2>

            <div className='mt-3 bg-white text-black p-5 border-round mb-5' style={{ width: 750 }}>
                <div>
                    <div className="field-checkbox">
                        <Checkbox inputId="interno" name="interno" onChange={onSelectReclutamiento} checked={reclutamiento.name.indexOf('externo') == -1} />
                        <label htmlFor="interno">Reclutamiento Interno</label>
                    </div>
                    <div className="field-checkbox">
                        <Checkbox inputId="externo" name="externo" onChange={onSelectReclutamiento} checked={reclutamiento.name.indexOf('interno') == -1} />
                        <label htmlFor="externo">Reclutamiento Externo</label>
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
                                <label htmlFor="empresa">Empresa externa</label>
                            </div>
                        </div>
                    )
                }
                {
                    reclutamiento.name.indexOf('interno') !== -1 ? (<BodyInterno />) : (<BodyExterno tipoExterno={reclutamiento.type} />)
                }

                <div className='flex gap-4 justify-content-center mt-6 mb-3'>
                    <Button className='p-button-primary p-button-sm' icon="pi pi-save" label="Guardar" />
                    <Button className='p-button-primary p-button-sm' icon="pi pi-pencil" label="Editar" />
                    <Button onClick={() => goToAdd(reclutamiento.name)} className='p-button-primary p-button-sm' icon="pi pi-arrow-right" label="Siguiente" />
                </div>
            </div>
        </div>
    )
}
