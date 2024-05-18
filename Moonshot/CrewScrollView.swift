//
//  CrewScrollView.swift
//  Moonshot
//
//  Created by Arseniy Oksenoyt on 5/17/24.
//

import SwiftUI

struct CrewScrollView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id:\.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let crew = [
        CrewScrollView.CrewMember(role: "Commander", astronaut: astronauts["astronaut1"]!),
        CrewScrollView.CrewMember(role: "Pilot", astronaut: astronauts["astronaut2"]!)
    ]
    
    return CrewScrollView(crew: crew)
}
