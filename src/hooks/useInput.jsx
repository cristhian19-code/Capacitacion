import { useState } from "react";

import moment from 'moment'

export const useInput = (initialValue = '') => {
    const [value, setValue] = useState(initialValue);

    const onChange = (e) => {
        const validateDate = moment.isDate(e.target.value);
        console.log(validateDate);
        setValue({
            ...value,
            [e.target.name]: e.target.value
        })
    }

    return {
        value,
        onChange
    }
}