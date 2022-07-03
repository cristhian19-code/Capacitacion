import { Button } from 'primereact/button'
import { InputText } from 'primereact/inputtext'
export const NuevoCandidato = () => {

    const onSubmit = (e) => {
        e.preventDefault();
    }

    return (
        <div className="px-3 flex flex-column justify-content-center align-items-center">
            <h1 className='text-white mt-7'>Nuevo Candidato</h1>

            <form className='mt-3 bg-white text-black p-5 border-round mb-5' style={{ width: 750 }} onSubmit={onSubmit}>
                <table>
                    <colgroup>
                        <col style={{ width: '30%' }} />
                        <col style={{ width: '70%' }} />
                    </colgroup>
                    <tr>
                        <td>Nombre</td>
                        <td>
                            <InputText className='ml-4 w-full' />
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td>Apellido</td>
                        <td>
                            <InputText className='ml-4 w-full' />
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td>Correo Electronico</td>
                        <td>
                            <InputText type='email' className='ml-4 w-full' />
                        </td>
                    </tr>
                    <br />
                    <tr>
                        <td>Telefono/Celular</td>
                        <td>
                            <InputText type='tel' className='ml-4 w-full' />
                        </td>
                    </tr>
                </table>

                <h4>Documentos Personales</h4>

                <div className='flex align-items-center' style={{ gap: 30 }}>
                    <span>CV</span>
                    <Button className='p-button-sm' color='primary' icon="pi pi-upload" label="Adjuntar" />
                    <div className='flex align-items-center'>
                        <i style={{ fontSize: 25 }} className='pi pi-file-pdf'></i>
                        CV_remir
                    </div>

                    <Button icon="pi pi-times" className="p-button-rounded p-button-text" />
                </div>
                <br />
                <div className='flex align-items-center' style={{ gap: 30 }}>
                    <span>DNI</span>

                    <Button className='p-button-sm' color='primary' icon="pi pi-upload" label="Adjuntar" />
                    <div className='flex align-items-center'>
                        <i style={{ fontSize: 25 }} className='pi pi-file-pdf'></i>
                        DNI_remir
                    </div>

                    <Button icon="pi pi-times" className="p-button-rounded p-button-text" />
                </div>

                <div className='flex gap-4 justify-content-center mt-6 mb-3'>
                    <Button className='p-button-primary p-button-sm' icon="pi pi-save" label="Guardar" />
                    <Button className='p-button-primary p-button-sm' icon="pi pi-arrow-right" label="Siguiente" />
                </div>
            </form>

        </div>
    )
}
