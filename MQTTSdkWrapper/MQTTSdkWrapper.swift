//
//  MQTTSdkWrapper.swift
//  MQTTSdkWrapper
//
//  Created by Mekhak Ghapantsyan on 12.12.25.
//

import Foundation
import CocoaMQTT

@objcMembers
public class MQTT5SdkWrapper: NSObject {
    
    
    private var client: CocoaMQTT5
    
    public init(clinetID: String, host: String, port: UInt16) {
        self.client = CocoaMQTT5(
            clientID: clinetID,
            host: host,
            port: port,
        )
        super.init()
    }
    
    @objc
    public func connect() -> Bool {
        return self.client.connect()
    }
    
    @objc
    public func disconnect() {
        self.client.disconnect()
    }
    
    @objc
    public func subscribe(
        topic: [Mqtt5SubscriptionWrapper],
    ) {
        self.client.subscribe(
            topic.map({MqttSubscription(topic: $0.topic)}),
        )
    }
    
    @objc
    public func publish(message: Mqtt5Publishing) {
        self.client.publish(
            CocoaMQTT5Message(
                topic: message.topic,
                string: message.payload,
            ),
            properties: MqttPublishProperties(
                contentType: message.conetntType,
            )
        )
    }
    
    @objc
    public func isConnected() -> Bool {
        client.connState == .connected
    }
    
    @objc func isConnectedOrReconnecting() -> Bool {
        client.connState == .connected || client.connState == .connecting
    }
    
}


//extension MQTT5SdkWrapper: CocoaMQTT5Delegate {
//    public func mqtt5(_ mqtt5: CocoaMQTT5, didConnectAck ack: CocoaMQTTCONNACKReasonCode, connAckData: MqttDecodeConnAck?) {
//
//    }
//    
//    public func mqtt5(_ mqtt5: CocoaMQTT5, didPublishMessage message: CocoaMQTT5Message, id: UInt16) {
//        
//    }
//    
//    public func mqtt5(_ mqtt5: CocoaMQTT5, didPublishAck id: UInt16, pubAckData: MqttDecodePubAck?) {
//        
//    }
//    
//    public func mqtt5(_ mqtt5: CocoaMQTT5, didPublishRec id: UInt16, pubRecData: MqttDecodePubRec?) {
//        
//    }
//    
//    public func mqtt5(_ mqtt5: CocoaMQTT5, didReceiveMessage message: CocoaMQTT5Message, id: UInt16, publishData: MqttDecodePublish?) {
//        
//    }
//    
//    public func mqtt5(_ mqtt5: CocoaMQTT5, didSubscribeTopics success: NSDictionary, failed: [String], subAckData: MqttDecodeSubAck?) {
//        
//    }
//    
//    public func mqtt5(_ mqtt5: CocoaMQTT5, didUnsubscribeTopics topics: [String], unsubAckData: MqttDecodeUnsubAck?) {
//        
//    }
//    
//    public func mqtt5(_ mqtt5: CocoaMQTT5, didReceiveDisconnectReasonCode reasonCode: CocoaMQTTDISCONNECTReasonCode) {
//        
//    }
//    
//    public func mqtt5(_ mqtt5: CocoaMQTT5, didReceiveAuthReasonCode reasonCode: CocoaMQTTAUTHReasonCode) {
//        
//    }
//    
//    public func mqtt5DidPing(_ mqtt5: CocoaMQTT5) {
//        
//    }
//    
//    public func mqtt5DidReceivePong(_ mqtt5: CocoaMQTT5) {
//        
//    }
//    
//    public func mqtt5DidDisconnect(_ mqtt5: CocoaMQTT5, withError err: (any Error)?) {
//        
//    }
//
//    
//}

@objc
public class Mqtt5SubscriptionWrapper: NSObject {
    
    public var topic: String
    public var noLocal: Bool = false
    public var retainAsPublished: Bool = false
    public var subscriptionOptions: Bool = false
    
    public init(topic: String) {
        self.topic = topic
        self.noLocal = false
        self.retainAsPublished = false
    }
    
}

@objc
public class Mqtt5Publishing: NSObject {
    
    public var topic: String
    public var payload: String
    public var conetntType: String
    
    public init(topic: String, payload: String, conetntType: String) {
        self.topic = topic
        self.payload = payload
        self.conetntType = conetntType
    }

}
