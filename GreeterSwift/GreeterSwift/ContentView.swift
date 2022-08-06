//
//  ContentView.swift
//  GreeterSwift
//
//  Created by guanchengyun on 2022/8/6.
//  Copyright © 2022 chengyun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //问题1
    private var greeter: Greeter = Greeter()
    
    //问题2
    //改进：可扩展，可单元测试
    private var changeGreeter: Greeter = Greeter(client: .editTime(morning: 6, afternoon: 12, evening: 18)) // 改进x
    let ouput = Output.editOut(morning: "改进：早上好", afternoon: "改进：下午好", evening: "改进：晚上好")
    
    var body: some View {
        VStack(spacing: 12) {
            Text("问题1：实现一个满足测试的类").foregroundColor(.red)
            Text(greeter.client.outputString())
            
            Text("问题2：改进一个类以获得更好的测试").foregroundColor(.red)
            Text(changeGreeter.client.outputString(output: ouput))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
