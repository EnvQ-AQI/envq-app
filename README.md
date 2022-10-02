# envq-app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Git

We will keep two main branches the main branch which is the stable version of the product and the development branch.

For changes we will create a new branch with the following convention `f-shortDescription-developer`, for example this branch would be `f-splashScreen-are` for `Antonio Reyna Espinoza`. We create new branches and push changes like this: 

`~$ git checkout -b f-splashScreen-are` \
`~$ git add .` \
`~$ git commit -m "Add splash screen" .` \
`~$ git push origin head`

Whenever we make small changes, instead of creating new branches we will update the current branch instead using the flag `-ammend` like so:

`~$ git add.` \
`~$ git commit -ammend` \
`~$ git push origin head`

The branch naming convention is:

- `f` for `features`
- `bf` for `big fixes`

## Changes

On every update the developer must add the changes to the `changelog` so we have a proper wiki. All algorithms that are used for calculating things must be documented.
