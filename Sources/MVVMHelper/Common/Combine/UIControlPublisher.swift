//
//  File.swift
//  
//
//  Created by Leyter on 07.08.2023.
//

#if canImport(UIKit)
import UIKit
import Combine

extension UIControl {
    public struct EventPublisher: Publisher {

        public typealias Output = UIControl
        public typealias Failure = Never

        fileprivate var control: UIControl
        fileprivate var event: Event

        public func receive<S: Subscriber>(subscriber: S) where S.Input == Output, S.Failure == Failure {
            let subscription = EventSubscription<S>(control: control)
            subscription.target = subscriber
            
            subscriber.receive(subscription: subscription)

            control.addTarget(subscription, action: #selector(subscription.trigger), for: event)
        }
    }
}

private extension UIControl {
    class EventSubscription<Target: Subscriber>: Subscription
        where Target.Input == UIControl {
        
        var control: UIControl
        var target: Target?
        
        init(control: UIControl) {
            self.control = control
        }

        public func request(_ demand: Subscribers.Demand) {}

        public func cancel() {
            target = nil
        }

        @objc func trigger() {
            _ = target?.receive(control)
        }
    }
}

extension UIControl {
    public func publisher(for event: Event) -> EventPublisher {
        EventPublisher(control: self, event: event)
    }
}
#endif
