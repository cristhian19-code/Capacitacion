import { useState } from "react";

import { Button } from "primereact/button";
import { Calendar } from "primereact/calendar";
import { Checkbox } from "primereact/checkbox";
import { Column } from "primereact/column";
import { DataTable } from 'primereact/datatable'
import { Dialog } from 'primereact/dialog'
import { InputText } from 'primereact/inputtext'

export const IngresarCandidatoInterno = () => {

    const [dialog, setDialog] = useState(false)

    const onAddCandidatoInterno = (e) => {
        e.preventDefault();
    }

    const data = [
        { nombre: 'Christian', apellido: 'Aponte', correo: 'christian@gmail.com', telefono: '9198238', archivo: 'investigacion.pdf', estado: 'finalizado' }
    ]

    const onOpenDialog = () => {
        setDialog(!dialog)
    }

    return (
        <div className="px-3 flex flex-column justify-content-center align-items-center">
            <h1 className='text-white mt-7'>Informacion de la Publicacion</h1>

            <form className='mt-3 bg-white text-black p-5 border-round mb-5' onSubmit={onAddCandidatoInterno} style={{ width: 750 }}>
                <table>
                    <colgroup>
                        <col style={{ width: '30%' }} />
                        <col style={{ width: '70%' }} />
                    </colgroup>
                    <tr>
                        <td>Personal Objetivo</td>
                        <td>Toda la compañia</td>
                    </tr>
                    <br />

                    <tr>
                        <td>Fecha de cierre de la publicacion</td>
                        <td>
                            <Calendar id='fec_cierre' disabled className='p-inputtext-sm w-6' />
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td>Nombre del Cargo</td>
                        <td>Jefe de Contabilidad</td>
                    </tr>
                    <br />
                    <tr>
                        <td>Descripcion del trabajo</td>
                        <td>Se necesita profesional para realizar contabilidad de toda la empresa</td>
                    </tr>
                    <br />
                    <tr>
                        <td>Perfil del cargo</td>
                        <td>El candidato debe ser proactivo en habilkidades de liderazgo</td>
                    </tr>
                    <br />
                    <tr>
                        <td>Requisitos</td>
                        <td>Alta cumplimiento de metas en la compaña y cuatro años de experiencia</td>
                    </tr>
                    <br />
                    <tr>
                        <td style={{ verticalAlign: 'top' }}>Estado de publicacion</td>
                        <td>
                            <div>
                                <div className="field-checkbox">
                                    <Checkbox inputId="aprobada" name="aprobada" checked disabled />
                                    <label htmlFor="aprobada">Publicacion Aprobada</label>
                                </div>
                                <div className="field-checkbox">
                                    <Checkbox inputId="rechazada" name="rechazada" />
                                    <label htmlFor="rechazada" disabled>Publicacion Rechazada</label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td>Estado de publicacion</td>
                        <td>Ninguna</td>
                    </tr>
                </table>

                <DataTable value={data} className="mt-5" responsiveLayout="scroll">
                    <Column field="nombre" header="Nombre"></Column>
                    <Column field="apellido" header="Apellido"></Column>
                    <Column field="correo" header="Correo Electronico"></Column>
                    <Column field="telefono" header="Telefono"></Column>
                    <Column field="archivo" header="Archivo Adjunto"></Column>
                    <Column field="estado" header="Estado Proceso"></Column>
                </DataTable>

                <Dialog style={{ width: 600 }} header="Agregar candidato" visible={dialog} onHide={onOpenDialog}>
                    <table className="w-full">
                        <colgroup>
                            <col style={{ width: '50%' }} />
                            <col style={{ width: '50%' }} />
                        </colgroup>
                        <tr>
                            <td>Nombre</td>
                            <td>
                                <InputText className="w-full" />
                            </td>
                        </tr>
                        <tr>
                            <td>Correo Electronico</td>
                            <td>
                                <InputText className="w-full" />
                            </td>
                        </tr>
                        <tr>
                            <td>Telefono/Celular</td>
                            <td>
                                <InputText className="w-full" />
                            </td>
                        </tr>
                        <tr>
                            <td>Curriculo</td>
                            <td>
                                <Button className="p-button-danger" icon="pi pi-upload" label="Adjuntar" />
                            </td>
                        </tr>
                    </table>
                    <div className="flex justify-content-center gap-4 mt-5">
                        <Button className="p-button-danger" icon="pi pi-save" label="Guardar" />
                        <Button className="p-button-danger" icon="pi pi-pencil" label="Editar" />
                        <Button className="p-button-danger" icon="pi pi-times" label="Cancelar" />
                    </div>
                </Dialog>


                <div className="flex mt-2" style={{ gap: 10 }}>
                    <Button icon="pi pi-plus" onClick={onOpenDialog} />
                    <Button icon="pi pi-pencil" />
                    <Button icon="pi pi-times" />
                </div>
                <div className='flex gap-4 justify-content-center mt-6 mb-3'>
                    <Button className='p-button-primary p-button-sm' icon="pi pi-save" label="Guardar" />
                    <Button className='p-button-primary p-button-sm' icon="pi pi-arrow-right" label="Siguiente" />
                </div>
            </form>
        </div>
    )
}
