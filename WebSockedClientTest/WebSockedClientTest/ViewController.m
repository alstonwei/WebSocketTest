//
//  ViewController.m
//  WebSockedClientTest
//
//  Created by epailive on 16/2/17.
//
//

#import "ViewController.h"

#import "PSWebSocket.h"


@interface ViewController ()<PSWebSocketDelegate>
@property (nonatomic, strong) PSWebSocket *webSocket;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webSocket open];
}

- (PSWebSocket *)webSocket
{
    if (!_webSocket) {
        // create the NSURLRequest that will be sent as the handshake
        //wss://10.10.150.122:8080/live/client/17338/199/false/0
        //wss://10.10.10.97/live/client/17338/199/false/0
        //ws://10.10.150.122:8080/live/client/17338/199/false/0
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://127.0.0.1:9001"]];
        
        // create the socket and assign delegate
        _webSocket = [PSWebSocket clientSocketWithRequest:request];
        _webSocket.delegate = self;
    }
    return _webSocket;
}


#pragma MARK PSWebSocketDelegate


- (void)webSocketDidOpen:(PSWebSocket *)webSocket {
    NSLog(@"The websocket handshake completed and is now open!");
    //[webSocket send:@"Hello world!"];
    //[webSocket send:@"0"];
}
- (void)webSocket:(PSWebSocket *)webSocket didReceiveMessage:(id)message {
    NSLog(@"The websocket received a message: %@", message);
}
- (void)webSocket:(PSWebSocket *)webSocket didFailWithError:(NSError *)error {
    NSLog(@"The websocket handshake/connection failed with an error: %@", error);
}
- (void)webSocket:(PSWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    NSLog(@"The websocket closed with code: %@, reason: %@, wasClean: %@", @(code), reason, (wasClean) ? @"YES" : @"NO");
}


@end
