# Deeplinks Flutter

Este é um projeto Flutter que utiliza **GoRouter**, **Deeplinks** e **Firebase Messaging** para navegação, manipulação de links profundos (deeplinks) e notificações push.

## Tecnologias

- **Flutter**: Framework para desenvolvimento de apps nativos.
- **GoRouter**: Gerenciador de rotas declarativo para Flutter.
- **Deeplinks**: Maneira de fazer o app responder a URLs externas e abrir telas específicas dentro do app.
- **Firebase Messaging**: Serviço de notificações push do Firebase para enviar e receber mensagens em tempo real.

## Instalação

1. **Clone o repositório**:

   ```bash
   git clone https://github.com/WemersonDamasceno/deeplinks.git
   ```

2. **Instale as dependências**:

   Navegue até a pasta do projeto e execute:

   ```bash
   flutter pub get
   ```

3. **Configuração do Firebase**:

   - Crie um projeto no [Firebase Console](https://console.firebase.google.com/).
   - Adicione o seu app Flutter ao projeto.
   - Baixe o arquivo `google-services.json` (para Android) e `GoogleService-Info.plist` (para iOS).
   - Coloque o arquivo `google-services.json` na pasta `android/app` e o arquivo `GoogleService-Info.plist` na pasta `ios/Runner`.

4. **Configuração de Deeplinks**:

   ### Android
   Abra o arquivo `android/app/src/main/AndroidManifest.xml` e adicione o seguinte código dentro da tag `<activity>` para habilitar os **deeplinks** no seu app:

   ```xml
   <activity
       android:name=".MainActivity"
       android:label="Deeplinks App"
       android:launchMode="singleTask"
       android:theme="@style/LaunchTheme"
       android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|screenLayout|density|locale"
       android:hardwareAccelerated="true"
       android:windowSoftInputMode="adjustResize">
   
       <!-- Deeplink Configuration -->
       <intent-filter>
           <action android:name="android.intent.action.VIEW" />
           <category android:name="android.intent.category.DEFAULT" />
           <category android:name="android.intent.category.BROWSABLE" />
           <data android:scheme="https" android:host="novasystem.deeplinks_app.com" />
       </intent-filter>
   </activity>
   ```

   - Isso permite que o Android abra seu app quando um link do tipo `https://novasystem.deeplinks_app.com` for acionado.
   
   ### iOS
   Abra o arquivo `ios/Runner/Info.plist` e adicione as seguintes configurações para permitir o suporte a deeplinks:

   ```xml
   <key>CFBundleURLTypes</key>
   <array>
       <dict>
           <key>CFBundleURLSchemes</key>
           <array>
               <string>novasystem.deeplinks_app.com</string>
           </array>
       </dict>
   </array>
   ```

## Configuração de Rotas (GoRouter)

O **GoRouter** é utilizado para gerenciar a navegação do app de forma declarativa. Abaixo está o exemplo de como as rotas estão configuradas:

```dart
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => const HomeShopPage(),
      routes: [
        GoRoute(
          path: 'productId/:productId',
          builder: (context, state) {
            final productId = state.pathParameters['productId'] ?? '';
            return ProductDetails(productId: productId);
          },
        ),
      ],
    ),
  ],
);
```

- A tela inicial é a `SplashPage`.
- A página de produtos é acessada através de `/products`.
- Cada produto possui um `productId` acessível através de `/products/productId/:productId`.

## Configuração de Deeplinks

Para que o app responda aos links profundos (deeplinks), você deve configurar o seu app para capturar esses links e navegar para a tela correta.

Exemplo de URL de deeplink:

```
https://novasystem.deeplinks_app.com/products/productId?productId=456
```

O código a seguir manipula o deeplink e navega para a tela de detalhes do produto:

```dart
void onListenerNotification(RemoteMessage? message) async {
  if (message == null) return;

  if (message.data['isDeeplink'] == "true" &&
      message.data['deeplink'] != null) {
    final String deeplink = message.data['deeplink'];

    if (deeplink.contains('productId')) {
      final Uri uri = Uri.parse(deeplink);
      final productId = uri.queryParameters['productId'];

      if (productId != null) {
        router.go('/products/productId/$productId');
      }
    }
  }
}
```

## Configuração de Firebase Messaging

Adicione a configuração do Firebase Messaging para receber notificações push. Abaixo está o exemplo de como configurar o listener de notificações no Flutter:

1. **Adicione dependências no `pubspec.yaml`**:

   ```yaml
   dependencies:
     firebase_core: ^1.10.0
     firebase_messaging: ^11.0.0
     go_router: ^14.8.0

   ```

2. **Inicialize o Firebase Messaging**:

   No `main.dart`, inicialize o Firebase e configure o Firebase Messaging:

   ```dart
   void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseService().initNotification();
    runApp(const MyApp());
   }
   ```

3. **Escute as notificações**:

   Configure o listener para quando o app estiver em primeiro plano:

   ```dart
     import 'dart:developer';
  
    import 'package:deeplinks_app/presentation/router/router.dart';
    import 'package:firebase_messaging/firebase_messaging.dart';
    
    class FirebaseService {
      // create a instance of FirebaseService
      final _firebaseMenssaging = FirebaseMessaging.instance;
    
     Future<void> initNotification() async {
       await _firebaseMenssaging.requestPermission();
    
       final fCMToken = await _firebaseMenssaging.getToken();
       log(fCMToken.toString());
    
       initPushNotifications();
     }

    void onListenerNotification(RemoteMessage? message) async {
      if (message == null) return;
  
      if (message.data['deeplink'] != null) {
        final String deeplink = message.data['deeplink'];
  
        if (deeplink.contains('productId')) {
          final Uri uri = Uri.parse(deeplink);
          final productId = uri.queryParameters['productId'];
  
          if (productId != null) {
            router.go('/products/productId?productId=$productId');
          }
        }
      }
    }

    Future<void> initPushNotifications() async {
      FirebaseMessaging.instance.getInitialMessage().then(onListenerNotification);
      FirebaseMessaging.onMessageOpenedApp.listen(onListenerNotification);
     }  
    }

   ```


## Testando Deeplinks

Você pode testar o seu deeplink utilizando o comando ADB no Android:

```bash
//adb shell am start -a android.intent.action.VIEW -d "https://novasystem.deeplinks_app.com/products/productId?productId=456" com.novasystem.deeplinks_app
```

Para testar em iOS, você pode usar o Xcode ou um simulador de dispositivo para testar o deeplink diretamente no navegador.
