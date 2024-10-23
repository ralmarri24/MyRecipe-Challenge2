//
//  addrecipepage.swift
//  recipe1
//
//  Created by Raghad Mohammed Almarri on 17/04/1446 AH.
//

import SwiftUI

struct AddRecipePage: View {
    @State private var recipeTitle: String = ""
    @State private var recipeDescription: String = ""
    @State private var ingredient: String = ""
    @State private var showImagePicker: Bool = false
    @State private var recipeImage: UIImage?

    var body: some View {
        VStack {
            // Top Bar
            HStack {
                Button("back") {
                    // Action to navigate back
                }.padding(.leading,10)
                .foregroundColor((Color (red:0.98, green:0.38,blue:0.07))
                )
                
         
                
            
                Spacer()
                
                Button("Save") {
                    // Save action here
                }
                .padding(.trailing,10)
                .foregroundColor((Color (red:0.98, green:0.38,blue:0.07))
                )
                
            }
     
            
            Text("New Recipe")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.trailing,200)
                .foregroundColor(.primary) // Works in dark and light mode
                //.padding(.all)
     
            
            // Upload Photo Section
            VStack {
                if let recipeImage = recipeImage {
                    Image(uiImage: recipeImage)
                        .resizable()//
                        .scaledToFill()
                        .frame(height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                } else {
                    Button(action: {
                        showImagePicker.toggle()
                    }) {
                        VStack {
                            Image("photo")
                                .resizable()
                                .frame(width: 86, height: 65)
                                .foregroundColor(.orange)
                            
                            Text("Upload Photo")
                                .foregroundColor(Color (red:0.98, green:0.38,blue:0.07))
                               
                            
                           
                        }
                        .padding()
                        .frame(width: 500, height:200)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .overlay(
                            Rectangle() // The shape for the dashed border
                                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [7, 5])) // Create dashed stroke
                                .foregroundColor(Color((Color (red:0.98, green:0.38,blue:0.07))
                                                      )))
                        
            
                                                        
                    }
                }
            }
            .padding()
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $recipeImage)
            }
            
            // Title TextField
            VStack(alignment: .leading) {
                Text("Title")
                    .font(.system(size: 24, weight: .bold)) // Custom size and weight
                    .foregroundColor(.primary) // Works in dark and light mode
                
                TextField("Title", text: $recipeTitle)
                    .padding()
                    .background(Color.gray.opacity(0.2)) // Darker gray background
                    .cornerRadius(5)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            // Description TextEditor without white square
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.system(size: 24, weight: .bold)) // Custom size and weight
                    
                ZStack(alignment: .topLeading) {
                    
                    TextEditor(text: $recipeDescription)
                        .padding(.top,5)
                        .padding(.leading,10)
//                        .frame(width: 370, height: 100)
                        .scrollContentBackground(.hidden)
                        .background(Color.gray.opacity(0.2)) // Darker gray background
                        .cornerRadius(5)
                    
                    if recipeDescription.isEmpty {
                        Text("Description")
                            .foregroundColor(Color.gray)
                            .padding(.top,10)
                            .padding(.leading,15)

                    }
                
//                            RoundedRectangle(cornerRadius: 5)
//                        .foregroundColor(Color.gray.opacity(0.1)) // No white border
//                        .background(Color.gray.opacity(0.1)) // Darker gray background
//                 
                               
                     
                }
         .frame(height: 100)
            }
            .padding(.horizontal)
            
            // Add Ingredient Section
            HStack {
                VStack(alignment: .leading) {
                    Text("Add Ingredient")
                        .font(.system(size: 24, weight: .bold)) // Custom size and weight
                        .foregroundColor(.primary) // Works in dark and light mode
                    
              
                        .padding(10)
                        
                       

                              }
                
                Spacer()
                
                Button(action: {
                    // Action to add ingredient
                }) {
                    Image(systemName: "plus")
                        .font(.title.bold())
                        .foregroundColor((Color (red:0.98, green:0.38,blue:0.07))
                        )
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        // .background(Color.black.edgesIgnoringSafeArea(.all)) // Full black background
    }
}

// ImagePicker to handle image upload
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }

            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

struct AddRecipePage_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipePage()
    }
}
