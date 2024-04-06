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
    @StateObject var vmCategory = CategoryModel()
    var tipo: String
    var monto: String
    @State var referencia: String = ""
    @State var date: Date = .now
    @State var selected: String = "Sueldo"
    @State var validation = false
    @State private var isShowingCategories = false
    @State private var selectedCategory: String?
    @Environment(\.presentationMode) var presentationMode
  
    
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
                            .frame(width: 36, height: 36)
                        HStack{
                            TextField("Agrega una descripcion", text: $referencia)
                                .bold()
                                .padding(.leading,5)
                                .submitLabel(.done) // palabra que se muestra en el keyboard
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
                        Image(systemName: "archivebox")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 29,height: 29)
                        
                        HStack{
                            Button {
                                isShowingCategories.toggle()
                            } label: {
                                Text(selectedCategory ?? "Seleccionar categoria")
                                    .bold()
                                LogoCirclePorTipo(tipo: selectedCategory ?? "")
                                    .padding(.leading)
                                    .opacity((selectedCategory != nil) ? 1 : 0)
                                    
                                             }

                            LogoWarning().opacity(validation ? 1 : 0)
                                .padding(.trailing)
                        }
                        .padding(.leading,15)
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
                            .frame(width: 29,height: 29)
                        
                        Text("\(tipo.dropLast())")
                            .fontWeight(.semibold)
                            .padding(.leading,15)
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
                            .frame(width: 30,height: 30)
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
            .padding(.bottom,20)
    
            Spacer()
            
            VStack{
                Button(action: {
                    if referencia.isEmpty {
                        validation = true
                    } else {
                        vmRegistros.saveRegistro(tipo: tipo, monto: monto, detalle: referencia, categoria: selectedCategory ?? "", fecha: date)
                        vmRegistros.balance()
                        vmRegistros.sumaIngresos = vmRegistros.sumarRegistrosPorTipo(tipo: .Ingresos)
                        vmRegistros.sumaAhorros = vmRegistros.sumarRegistrosPorTipo(tipo: .Ahorros)
                        vmRegistros.sumaGastos = vmRegistros.sumarRegistrosPorTipo(tipo: .Gastos)
                    }
                 
                }, label: {
                    ButtonAceptar(name: "Aceptar")
                })
            }
            .padding(.bottom,80)
           
        }
        .navigationTitle("Guardar Registro")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isShowingCategories, content: {
            CategorysViewSheet(isShowingCategories: $isShowingCategories, vmCategory: vmCategory, categorias: vmCategory.mostFrequent, selectedCategory: $selectedCategory)
        })
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    NewRegPart2(vmRegistros: RegistrosViewModel(), vmNewR: ViewModelNewRegistro(), tipo: "Ingresos", monto: "")
}
