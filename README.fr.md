*[English](README.md) • [Français](README.fr.md).*

# DigitekaSDK
![version](https://img.shields.io/badge/version-1.0.0-blue) [![swift-package-manager](https://img.shields.io/badge/package%20manager-compatible-brightgreen.svg?logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iNjJweCIgaGVpZ2h0PSI0OXB4IiB2aWV3Qm94PSIwIDAgNjIgNDkiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8IS0tIEdlbmVyYXRvcjogU2tldGNoIDYzLjEgKDkyNDUyKSAtIGh0dHBzOi8vc2tldGNoLmNvbSAtLT4KICAgIDx0aXRsZT5Hcm91cDwvdGl0bGU+CiAgICA8ZGVzYz5DcmVhdGVkIHdpdGggU2tldGNoLjwvZGVzYz4KICAgIDxnIGlkPSJQYWdlLTEiIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxnIGlkPSJHcm91cCIgZmlsbC1ydWxlPSJub256ZXJvIj4KICAgICAgICAgICAgPHBvbHlnb24gaWQ9IlBhdGgiIGZpbGw9IiNEQkI1NTEiIHBvaW50cz0iNTEuMzEwMzQ0OCAwIDEwLjY4OTY1NTIgMCAwIDEzLjUxNzI0MTQgMCA0OSA2MiA0OSA2MiAxMy41MTcyNDE0Ij48L3BvbHlnb24+CiAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJQYXRoIiBmaWxsPSIjRjdFM0FGIiBwb2ludHM9IjI3IDI1IDMxIDI1IDM1IDI1IDM3IDI1IDM3IDE0IDI1IDE0IDI1IDI1Ij48L3BvbHlnb24+CiAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJQYXRoIiBmaWxsPSIjRUZDNzVFIiBwb2ludHM9IjEwLjY4OTY1NTIgMCAwIDE0IDYyIDE0IDUxLjMxMDM0NDggMCI+PC9wb2x5Z29uPgogICAgICAgICAgICA8cG9seWdvbiBpZD0iUmVjdGFuZ2xlIiBmaWxsPSIjRjdFM0FGIiBwb2ludHM9IjI3IDAgMzUgMCAzNyAxNCAyNSAxNCI+PC9wb2x5Z29uPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+)](https://github.com/digiteka/outstream-ios-sdk)


DigitekaSDK est un SDK à intégrer dans votre application. Il vous permet d'intégrer des vidéos "outstream" ou des "display ads". 
L'app Sample utilise DigitekaSDK.xcframework et montre un exemple d'intégration. 

## Lancer l'app demo

Clonez ce [repository](https://github.com/digiteka/outstream-ios-samples) git, ouvrez-le avec Xcode et executez le projet 

## Prérequis

Il y a quelques prérequis avant d'installer le SDK 
* Utiliser Xcode 12.0 ou supérieur.
* Votre application cible iOS 12.0 ou supérieur.

## Intégration avec SPM

DigitekaSDK est distribué avec Swift Package Manager.
Pour intégrer le SDK dans votre projet Xcode à l'aide de SPM, spécifiez cette URL de package:
```
https://github.com/digiteka/outstream-ios-sdk
```

## Configuration

### App Transport Security
Votre `Info.plist` doit contenir ces clés:
```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
    <key>NSAllowsArbitraryLoadsForMedia</key>
    <true/>
    <key>NSAllowsArbitraryLoadsInWebContent</key>
    <true/>
</dict>
```

### App Tracking Transparency & IDFA
Depuis iOS 14, votre application doit demander le consentement de l'utilisateur avant de pouvoir le suivre.
Vous pouvez trouver plus d'informations sur cette intégration dans la [documentation Apple](https://developer.apple.com/documentation/apptrackingtransparency)

## Intégration

### Initialisation du SDK
1. Importez le header DigitekaSDK
```
import DigitekaSDK
```

2. Créer le DTKConfig
```
let dtkConfig = DTKConfig(
    baseUrl: "<Votre baseUrl>",
    mdtk: "<Votre mdtk>")
```

3. Initialisation du SDK avec la configuration DTKConfig
```
Digiteka.shared.initialize(dtkConfig)
```

### Initialisation de la OutstreamView
1. Dans votre ViewController instancier une `OutstreamView` ou spécifiez cette classe à votre fichier xib ou storyboard et connectez-le avec un `@IBOutlet`
```
@IBOutlet weak var outstreamView: OutstreamView!
```


2. Initialiser votre `OutstreamView` avec le `OutstreamViewConfig` et un delegate (optionel):
```
let outstreamViewConfig = OutstreamViewConfig(
urlReferer: "<Your url referer>",
zone: <Your zone>,
adUnit: "<Specify adUnit (Optional)>")

outstreamView.initialize(config: outstreamViewConfig, delegate: self)
```

3. Ajouté les fonctions delegate (optionel):
```
extension <Your ViewController class>: OutstreamViewDelegate {
    func didUpdateHeight(_ ad: OutstreamView, height: CGFloat) {
        //Appelé lorsque la hauteur de l'annonce a changé
    }

    func onClose(_ ad: OutstreamView) {
        //Appelé à la fermeture de l'annonce
    }
    
    func didReceiveAd(_ ad: OutstreamView) {
        //Appelé lorsque vous recevez une annonce
    }
}
```

4. Si votre OutstreamView est à l'intérieure d'une scrollView, vous pouvez ajouter cette ligne à votre UIScrollViewDelegate, pour lancer / mettre en pause automatiquement la vidéo (optionel):
```
extension <Your ViewController class>: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        outstreamView.scrollViewDidScroll(scrollView)
    }
}
```

### Chargement de la pub
Le chargement de la pub est déclanchée avec la méthode `load()`. 
```
outstreamView.load()
```

## Changelog

Voir le fichier [changelog](CHANGELOG.md). 
