# Stefan's Development Hub

Hey ✌️

I'm Stefan and I'm glad you found the way to my personal development hub and portfolio 🤩

The goal of this repository is to present all kinds of development resources I gathered throughout my career as mobile developer in one central place, e.g.:

- My personal open source projects
- Mobile development interview questions
- Interesting new features of popular Swift packages
- Swift best practices and review guidelines
- Glossary of common abbreviations and acronyms
- FAQ's
- tbc.

This repository represents a Swift package whose sole purpose is to, fully automated, build a [Documentation Catalogue](https://www.swift.org/documentation/docc/adding-supplemental-content-to-a-documentation-catalog) using Apple's [DocC](https://www.swift.org/documentation/docc/). Each time something is pushed to `main` a static website is built and deployed to GitHub Pages by a [GitHub Action](./.github/workflows/deploy.yml). 

This website is reachable under https://blackjacx.github.io/Me/.

The cool point here is that the combination of GitHub and DocC gives you a nice looking and highly customizable website. All for free 🤑

## Using the Swift Package

To build the DocC archive, which can be imported and used directly in Xcode's local documentation tool, just open the `Package.swift` file, and select Product > Build Documentation. You can also do the same using the following command:

```shell
xcodebuild docbuild \
  -scheme Me \
  -destination generic/platform=macOS \
  -derivedDataPath .build && open .build/Build/Products/Debug/Me.doccarchive
```

## Development

This project is built automatically using a GitHub actions. Once built the following workflow deploys the website to the branch `gh-pages`:

[Deploy to GitHub Pages](https://github.com/marketplace/actions/deploy-to-github-pages)

Then GitHub's integrated pages deployment is triggered which copies the content of that branch to the actual webserver.

## Acknowledgements

The idea for the workflow and the general structue has been taken from:

[WWDC Notes](https://github.com/WWDCNotes/WWDCNotes)

## Links

- [DocC Documentation](https://www.swift.org/documentation/docc/)
- [How to document your project with DocC](https://www.hackingwithswift.com/articles/238/how-to-document-your-project-with-docc)
- [Adding Structure to your Documentation Pages](https://developer.apple.com/documentation/Xcode/adding-structure-to-your-documentation-pages)
- [Customizing The Appearance Of Your Documentation Pages](https://www.swift.org/documentation/docc/customizing-the-appearance-of-your-documentation-pages)
- [Example of a fully customized documentation website](https://mportiz08.github.io/swift-docc/documentation/docc/) ([theme-settings.json file](https://mportiz08.github.io/swift-docc/theme-settings.json))

