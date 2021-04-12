User.destroy_all
20.times do 
       User.create(
              name: Faker::Name.name,
              address: Faker::Address.street_address,
              email: Faker::Internet.email,
              password: Faker::Internet.password(min_length: 10, max_length: 20),
              admin: false
       )
end

User.create(
       name: "Admin principal",
       email: "Admin@gmail.com",
       password: "password",
       admin: true
)

Product.destroy_all

a = Product.create(
       name: "Tequeños de chocolate",
       description: "Los tequeños de chocolate son una masa frita rellena de chocolate fundido, precio por docena.",
       price: 5000
)
a.product.attach(io: File.open('app/assets/images/tequeños.jpg'), filename: "tequeños.jpg", content_type: "image/jpg")


b = Product.create(
       name: "Pastel tres leches",
       description: "El pastel tres leches es un bizcocho jugoso bañado en combinación de 3 leches cubierta de merengue, precio por unidad.",
       price: 7000
)
b.product.attach(io: File.open('app/assets/images/tres_leches.jpg'), filename: "tres_leches.jpg", content_type: "image/jpg")


c = Product.create(
       name: "Pasta seca",
       description: "Las pastas secas son una especialidad de repostería, son pequeñas galletas cocidas al horno, hecho con una pasta a base de harina, mantequilla, huevos, y, azúcar o sal, precio por docena.",
       price: 4000
)
c.product.attach(io: File.open('app/assets/images/pastaseca.jpg'), filename: "pastaseca.jpg", content_type: "image/jpg")


d = Product.create(
       name: "Palmerita",
       description: "Las palmeritas son unas galletas hechas a base de masa de hojaldre preparadas con una curiosa forma de 'oreja' cubiertas por azucar, precio por docena.",
       price:4000
)
d.product.attach(io: File.open('app/assets/images/palmeritas.jpg'), filename: "palmeritas.jpg", content_type: "image/jpg")


e = Product.create(
       name: "Mandoca",
       description: "Masa de maiz dulce frita, precio por docena.",
       price: 3000
)
e.product.attach(io: File.open('app/assets/images/mandocas.jpg'), filename: "mandocas.jpg", content_type: "image/jpg")


f = Product.create(
       name: "Pastel de calabaza",
       description: "Pastel hecho de una mezcla de bizcocho tradicional y calabaza",
       price: 7000
)
f.product.attach(io: File.open('app/assets/images/torta_auyama.jpg'), filename: "torta_auyama.jpg", content_type: "image/jpg")


g = Product.create(
       name: "Golfeado",
       description: "El golfeado es un pan dulce típico de la gastronomía de Venezuela, originario de la Región Capital del país, especialmente de la zona de los Altos Mirandinos, en particular de Carrizal, precio por unidad.",
       price: 3000
)
g.product.attach(io: File.open('app/assets/images/golfeado.png'), filename: "golfeado.png", content_type: "image/png")


h = Product.create(
       name: "Pan de guayaba",
       description: "El pan de guayaba es un pan dulce horneado relleno de una jalea de fruta(guayaba) endulzada, precio por unidad.",
       price: 2000
)
h.product.attach(io: File.open('app/assets/images/pan_guayaba.jpg'), filename: "pan_guayaba.jpg", content_type: "image/jpg")
                     

i = Product.create(
       name: "Brownie",
       description: "El brownie es un bizcocho de mezcla de chocolate con trozos de chocolate, precio por unidad",
       price: 1500
)
i.product.attach(io: File.open('app/assets/images/brownie.jpg'), filename: "brownie.jpg", content_type: "image/jpg")


j = Product.create(
       name: "Chip Cookies",
       description:"Galleta con receta tradicional de una masa compuesta de mantequilla con azúcar marena y azucar blanca con trozos de chocolate semi-dulces, precio por docena",
       price: 5000
)
j.product.attach(io: File.open('app/assets/images/cookies.jpg'), filename: "cookies.jpg", content_type: "image/jpg")


k = Product.create(
       name: "Cheesecake",
       description: "Tarta con fondo de galleta crujiente rellena de queso crema",
       price: 7000
)
k.product.attach(io: File.open('app/assets/images/cheese_cake.jpg'), filename: "cheese_cake.jpg", content_type: "image/jpg")


l = Product.create(
       name: "Pie de limon",
       description: "El pie de limon es una tarta formada por una base de masa de hojaldre que se rellena con crema de limón y es cubierta por merengue",
       price: 7000
)
l.product.attach(io: File.open('app/assets/images/pie_limon.jpg'), filename: "pie_limon.jpg", content_type: "image/jpg")

PaymentMethod.destroy_all
PaymentMethod.create(name: "Paypal Express Checkout", code: "PEC")

# a = Product.create(
#        name: "Producto de prueba seed with active storage",
#        description: "Producto de prueba active storage",
#        price: rand(2000..7000)
# )
# a.product.attach(io: File.open('app/assets/images/golfeado.png'), filename: "golfeado.png", content_type: "image/png")