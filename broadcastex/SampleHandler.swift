import ReplayKit

class SampleHandler: RPBroadcastSampleHandler {
    var info:String = ""
    override func broadcastStarted(withSetupInfo setupInfo: [String : NSObject]?) {
        // User has requested to start the broadcast. Setup info from the UI extension will be supplied.
        print("=======broadcastStarted \(setupInfo)\(Thread.current)")
        info = "hello"
    }
    
    override func broadcastPaused() {
        // User has requested to pause the broadcast. Samples will stop being delivered.
        print("=======broadcastPaused video\(Thread.current)")
    }
    
    override func broadcastResumed() {
        // User has requested to resume the broadcast. Samples delivery will resume.
        print("=======broadcastResumed video\(Thread.current)")
    }
    
    override func broadcastFinished() {
        // User has requested to finish the broadcast.
        print("=======broadcastFinished video\(Thread.current)")
    }
    
    override func processSampleBuffer(_ sampleBuffer: CMSampleBuffer, with sampleBufferType: RPSampleBufferType) {
        switch sampleBufferType {
            case RPSampleBufferType.video:
                // Handle audio sample buffer
                print("=======broadcastStarted video\(Thread.current)")
                break
            case RPSampleBufferType.audioApp:
                // Handle audio sample buffer for app audio
                print("=======broadcastStarted audio")
                break
            case RPSampleBufferType.audioMic:
                // Handle audio sample buffer for mic audio
                print("=======broadcastStarted mic")
                break
        }
    }
}
