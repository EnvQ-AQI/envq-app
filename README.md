# envq-app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on
mobile development, and a full API reference.

## Git

Mantendremos dos ramas principales la rama principal que es la versión estable del producto y la
rama de desarrollo.

Para hacer cambios crearemos una nueva rama con la siguiente
convención `f-shortDescription-developer`, por ejemplo esta rama sería `f-splashScreen-are`
para `Antonio Reyna Espinoza`. Creamos nuevas ramas y hacemos push de la siguiente manera:

`~$ git checkout -b f-splashScreen-are` \
`~$ git add .` \
`~$ git commit -m "Add splash screen" .` \
`~$ git push origin head`

Cada vez que hacemos pequeños cambios, en lugar de crear nuevas ramas, actualizaremos la rama actual
usando la bandera `-a`:

`~$ git add .` \
`~$ git commit -a` \
`~$ git push origin head`

Las convenciones para las iniciales de las ramas son:

- `f` para cuando se agregan características (f = features)
- `bf` para cuando se arreglan bugs (bf = bug fixes)

## Changes

En cada actualización, el desarrollador debe agregar los cambios a `changelog.md` para que tengamos
un wiki adecuado. Todos los algoritmos que se utilizan para calcular cosas deben estar documentados.
