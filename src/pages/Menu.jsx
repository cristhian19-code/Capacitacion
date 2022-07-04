import { Button } from "primereact/button";
import { Card } from "primereact/card";
import { useNavigate } from "react-router-dom";

export const Menu = () => {
    const navigate = useNavigate();

    const goToSolicitud = () => {
        navigate('/solicitud')
     };

    const goToPublicacion = () => {
        navigate('/revision_perfil')
     };

    return (
        <div className="flex flex-wrap justify-content-center align-items-center h-screen gap-3">
            <Card
                style={{ width: "25em" }}
                footer={<Button onClick={goToSolicitud} label="ir" icon="pi pi-arrow-right" />}
            >
                <h1 className="text-center">Realizar Solicitud</h1>
            </Card>
            <Card
                style={{ width: "25em" }}
                footer={<Button onClick={goToPublicacion} label="ir" icon="pi pi-arrow-right" />}
            >
                <h1 className="text-center">Solicitudes</h1>
            </Card>
        </div>
    );
};
