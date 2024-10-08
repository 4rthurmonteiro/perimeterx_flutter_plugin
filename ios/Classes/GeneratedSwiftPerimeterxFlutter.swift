// Autogenerated from Pigeon (v22.4.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class PigeonError: Error {
  let code: String
  let message: String?
  let details: Any?

  init(code: String, message: String?, details: Any?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "PigeonError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
      }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? PigeonError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

private class GeneratedSwiftPerimeterXFlutterPigeonCodecReader: FlutterStandardReader {
}

private class GeneratedSwiftPerimeterXFlutterPigeonCodecWriter: FlutterStandardWriter {
}

private class GeneratedSwiftPerimeterXFlutterPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return GeneratedSwiftPerimeterXFlutterPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return GeneratedSwiftPerimeterXFlutterPigeonCodecWriter(data: data)
  }
}

class GeneratedSwiftPerimeterXFlutterPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = GeneratedSwiftPerimeterXFlutterPigeonCodec(readerWriter: GeneratedSwiftPerimeterXFlutterPigeonCodecReaderWriter())
}


/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol PerimeterXHostApi {
  func getHeaders() throws -> [String: String]
  func handleResponse(response: String, url: String, completion: @escaping (Result<String, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class PerimeterXHostApiSetup {
  static var codec: FlutterStandardMessageCodec { GeneratedSwiftPerimeterXFlutterPigeonCodec.shared }
  /// Sets up an instance of `PerimeterXHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: PerimeterXHostApi?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let getHeadersChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.perimeterx_flutter_plugin.PerimeterXHostApi.getHeaders\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getHeadersChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getHeaders()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getHeadersChannel.setMessageHandler(nil)
    }
    let handleResponseChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.perimeterx_flutter_plugin.PerimeterXHostApi.handleResponse\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      handleResponseChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let responseArg = args[0] as! String
        let urlArg = args[1] as! String
        api.handleResponse(response: responseArg, url: urlArg) { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      handleResponseChannel.setMessageHandler(nil)
    }
  }
}
