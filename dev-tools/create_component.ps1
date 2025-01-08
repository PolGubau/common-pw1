param(
    [string]$n  # Nombre del componente a crear
)

# Comprobar si el nombre está vacío
if (-not $n) {
    Write-Host "Debe proporcionar un nombre de componente."
    exit
}

# Crear el directorio para el componente
$componentPath = ".\$n"
New-Item -ItemType Directory -Force -Path $componentPath

# Crear el archivo tsx del componente
$tsxFilePath = "$componentPath\$n.tsx"
$tsxContent = @"
import React from 'react';
import './$n.css';

const $n = () => {
    return (
        <div className="$n">
            <h1>$n Component</h1>
        </div>
    );
}

export default $n;
"@
Set-Content -Path $tsxFilePath -Value $tsxContent

# Crear el archivo CSS del componente
$cssFilePath = "$componentPath\$n.css"
$cssContent = @"
.$n {
    /* Add styles here */
}
"@
Set-Content -Path $cssFilePath -Value $cssContent

# Crear el archivo de pruebas del componente
$testFilePath = "$componentPath\$n.test.tsx"
$testContent = @"
import React from 'react';
import { expect, it } from 'vitest';
import { render } from '@testing-library/react';
import $n from './$n';

it('renders $n component', () => {
    const { getByText } = render(<$n />);
    expect(getByText('$n Component')).toBeInTheDocument();
});
"@
Set-Content -Path $testFilePath -Value $testContent

Write-Host "Component $n created successfully!"
