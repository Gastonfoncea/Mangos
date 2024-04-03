//
//  NewRegPart2.swift
//  Guita
//
//  Created by Gaston Foncea on 10/03/2024.
//

import SwiftUI

struct NewRegPart2: View {
    
    @StateObject var vmFunctions = GeneralFunctions()
    @ObservedObject var vmRegistros: RegistrosViewModel
    @ObservedObject var vmNewR : ViewModelNewRegistro
    var tipo: String
    var monto: String
    @State var referencia: String = ""
    @State var date: Date = .now
    @State var selected: String = "Sueldo"
    @Environment (\.dismiss) private var dismiss
    @State var validation = false
  
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text("Monto del \(tipo.dropLast())")
                .foregroundStyle(Color.fontColor1G)
                .bold()
            Text("$ \(vmFunctions.StringToInt(valor: monto))")
                .font(.system(size: AppTheme.fontSizeMontoNumericoGrande))
                .foregroundStyle(Color.fontColor1G)
                .bold()
                .padding(.top)
            
            Spacer()
            
            VStack{
                Divider()
                VStack{
                    HStack{
                        Image(systemName: "pencil.and.scribble")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 38)
                        
                        HStack{
                            TextField("Agrega una descripcion", text: $referencia)
                                .bold()
                                .padding(.leading,5)
                                .submitLabel(.done)
                                .onChange(of:referencia){
                                    validation = false
                                }
                            LogoWarning().opacity(validation ? 1 : 0)
                                .padding(.trailing)
                        }
                        Spacer()
                    }

                }
                .padding(.vertical)
                Divider()
                
                VStack{
                    HStack{
                        Image(systemName: "plus.app")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 29)
                        
                        Text("\(tipo.dropLast())")
                            .fontWeight(.semibold)
                            .padding(.leading,15)
                        LogoCirclePorTipo(tipo: tipo)
                            .padding(.leading)
                        Spacer()
                    }
                }
                .padding(.vertical)
                Divider()
                
                VStack{
                    HStack{
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                        DatePicker("", selection: $date,displayedComponents: .date)
                            .datePickerStyle(.automatic)
                            .fixedSize()
                            .padding(.leading,5)
                        Spacer()
                    }
                }
                .padding(.vertical)
                Divider()
                
            }
            .padding(.leading,20)
            .padding(.bottom,40)
    
            Spacer()
            
            VStack{
                Button(action: {
                    if referencia.isEmpty {
                        validation = true
                    } else {
                        vmRegistros.saveRegistro(tipo: tipo, monto: monto, detalle: referencia, fecha: date)
                        vmRegistros.balance()
                        vmRegistros.sumaIngresos = vmRegistros.sumarRegistrosPorTipo(tipo: .Ingresos)
                        vmRegistros.sumaAhorros = vmRegistros.sumarRegistrosPorTipo(tipo: .Ahorros)
                        vmRegistros.sumaGastos = vmRegistros.sumarRegistrosPorTipo(tipo: .Gastos)
                    }
                 
                }, label: {
                    ButtonAceptar(name: "Aceptar")
                })
            }
            .padding(.bottom,100)
           
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    NewRegPart2(vmRegistros: RegistrosViewModel(), vmNewR: ViewModelNewRegistro(), tipo: "Ingresos", monto: "")
}
