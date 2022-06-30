import { InputText } from 'primereact/inputtext';
import { Calendar } from 'primereact/calendar';
import { AutoComplete } from 'primereact/autocomplete';
import { InputNumber } from 'primereact/inputnumber';

import { Button } from 'primereact/button'

export const Solicitud = () => {

    const onSaveSolicitud = (e) => {
        e.preventDefault();
    }

    return (
        <div className="px-3 flex flex-column justify-content-center align-items-center">
            <h1 className='text-white mt-7'>Solicitud Postulante</h1>

            <form className='mt-3 bg-white text-black p-5 border-round mb-5' onSubmit={onSaveSolicitud} style={{ width: 750 }}>
                <table>
                    <tr>
                        <td>
                            <label htmlFor="fec_solicitud" className='mr-2'>Fecha Solicitud</label>
                        </td>
                        <td>
                            <Calendar id='fec_solicitud' className='p-inputtext-sm' />
                        </td>
                        <td style={{ width: 40 }}></td>
                        <td>
                            <label htmlFor="solicitante" className='mr-2'>Solicitante</label>
                        </td>
                        <td>
                            <InputText id='solicitante' className='p-inputtext-sm' />
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td>
                            <label htmlFor="tip_cargo" className='mr-2'>Tipo de Cargo</label>
                        </td>
                        <td>
                            <InputText id='tip_cargo' className='p-inputtext-sm' />
                        </td>
                        <td></td>
                        <td>
                            <label htmlFor="area" className='mr-2'>Area</label>
                        </td>
                        <td>
                            <InputText id='area' className='p-inputtext-sm' />
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td>
                            <label htmlFor="nom_cargo" className='mr-2'>Nombre de Cargo</label>
                        </td>
                        <td>
                            <AutoComplete id='nom_cargo' className='p-inputtext-sm' />
                        </td>
                        <td></td>
                        <td>
                            Codigo
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
                            Supervisar y controlar los trabajos en donde este asignado
                        </td>
                    </tr>

                    <br />

                    <tr>
                        <td colSpan={2}>
                            Conocimiento:
                        </td>
                        <td colSpan={3} style={{ fontSize: 12 }}>
                            Control de seguridad y de respuesta rapida en eventos en donde se puedan salir de control
                        </td>
                    </tr>
                    <br />

                    <tr>
                        <td colSpan={2}>
                            Experiencia:
                        </td>
                        <td colSpan={3} style={{ fontSize: 12 }}>
                            Contar con mas de 1 año en puestos similares
                        </td>
                    </tr>

                    <br />

                    <tr>
                        <td colSpan={2}>
                            Numero de vacantes
                        </td>
                        <td colSpan={3}>
                            <InputNumber min={0} className="p-inputtext-sm" />
                        </td>
                    </tr>
                    <br />

                    <tr>
                        <td colSpan={2}>
                            Comentario
                        </td>
                        <td colSpan={3}>
                            <InputText id='comentario' className='p-inputtext-sm' />
                        </td>
                    </tr>
                </table>

                <div className='flex gap-4 justify-content-center mt-6 mb-3'>
                    <Button className='p-button-primary p-button-sm' icon="pi pi-save" label="Guardar" />
                    <Button className='p-button-primary p-button-sm' icon="pi pi-pencil" label="Editar" />
                    <Button className='p-button-primary p-button-sm' icon="pi pi-arrow-right" label="Siguiente" />
                </div>
            </form>
        </div>
    )
}
