import { Button } from "primereact/button";
import { AutoComplete } from 'primereact/autocomplete'
import { Calendar } from 'primereact/calendar'

import { useNavigate } from 'react-router-dom'

export const RevisionPerfil = () => {
    const navigate = useNavigate();

    const onSaveSolicitud = (e) => {
        e.preventDefault();
    }

    const goToPublicacion = () => {
        navigate('/publicacion')
    }

    return (
        <div className="px-3 flex flex-column justify-content-center align-items-center">
            <h1 className="text-white mt-7">Solicitud Postulante</h1>
            <form className='mt-3 bg-white text-black p-5 border-round mb-5' onSubmit={onSaveSolicitud} style={{ width: 750 }}>
                <table>
                    <tr>
                        <td style={{ width: 150 }}>
                            Fecha Solicitud:
                        </td>
                        <td style={{ fontSize: 12 }}>
                            13/02/2022
                        </td>
                        <td></td>
                        <td style={{ width: 150 }}>
                            Solicitante:
                        </td>
                        <td style={{ fontSize: 12 }}>
                            Personal
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            Area:
                        </td>
                        <td style={{ fontSize: 12 }}>
                            Seguridad
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td>Tipo Cargo:</td>
                        <td style={{ fontSize: 12 }}>Supervision</td>
                        <td></td>
                        <td>Cogido:</td>
                        <td style={{ fontSize: 12 }}>17</td>
                    </tr>

                    <br />
                    <br />

                    <tr>
                        <td colSpan={1}>Nombre de Cargo:</td>
                        <td colSpan={4} style={{ fontSize: 12 }}>Jefe de Almacen</td>
                    </tr>

                    <br />
                    <br />

                    <tr>
                        <td colSpan={1}>Descripcion del Cargo:</td>
                        <td colSpan={4} style={{ fontSize: 12 }}>Mantener bajo control los eventos en donde se este solicitando</td>
                    </tr>
                    <br />

                    <tr>
                        <td colSpan={1}>Responsabilidad:</td>
                        <td colSpan={4} style={{ fontSize: 12 }}>Supervisar y controlar los trabajos en donde se asigne</td>
                    </tr>

                    <br />

                    <tr>
                        <td colSpan={1}>Experiencia:</td>
                        <td colSpan={4} style={{ fontSize: 12 }}>Contar con mas de 1 año en puestos similares</td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td className="flex justify-content-end">
                            <Button className="p-button-sm p-button-success" icon="pi pi-pencil" label="Editar Perfil" />
                        </td>
                    </tr>

                    <br />
                    <br />

                    <tr>
                        <td>Numero de vacantes:</td>
                        <td style={{ fontSize: 12 }}>1</td>
                        <td></td>
                        <td>Ubicacion:</td>
                        <td style={{ fontSize: 12 }}>Oficina Central</td>
                    </tr>
                    <br />

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Comentario:</td>
                        <td style={{ fontSize: 12 }}>Ninguna</td>
                    </tr>
                    <br />

                    <tr>
                        <td>
                            Tipo Revision:
                        </td>
                        <td>
                            <AutoComplete />
                        </td>
                        <td></td>
                        <td>
                            Estado:
                        </td>
                        <td style={{ fontSize: 12 }} className="text-red-500">
                            <b>Rechazado</b>
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td>
                            Fecha de Revision
                        </td>
                        <td>
                            <Calendar />
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <br />
                    <tr>
                        <td>
                            Hora de Revision
                        </td>
                        <td>
                            <Calendar timeOnly hourFormat="12" />
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>


                </table>
                <div className='flex gap-4 justify-content-center mt-6 mb-3'>
                    <Button className='p-button-primary p-button-sm' icon="pi pi-save" label="Guardar" />
                    <Button className='p-button-primary p-button-sm' icon="pi pi-pencil" label="Editar" />
                    <Button className='p-button-primary p-button-sm' icon="pi pi-arrow-right" label="Siguiente" onClick={goToPublicacion} />
                </div>
            </form>
        </div>
    )
}
