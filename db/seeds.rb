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

Product.destroy_all
Product.create(
       [
              {
                     name: "Tequeños de chocolate",
                     description: "Los tequeños de chocolate son una masa frita rellena de chocolate fundido, precio por docena.",
                     price: 5000
              },
              {
                     name: "Pastel tres leches",
                     description: "El pastel tres leches es un bizcocho jugoso bañado en combinación de 3 leches cubierta de merengue, precio por unidad.",
                     price: 7000
              },
              {
                     name: "Pasta seca",
                     description: "Las pastas secas son una especialidad de repostería, son pequeñas galletas cocidas al horno, hecho con una pasta a base de harina, mantequilla, huevos, y, azúcar o sal, precio por docena.",
                     price: 4000
              },
              {
                     name: "Palmerita",
                     description: "Las palmeritas son unas galletas hechas a base de masa de hojaldre preparadas con una curiosa forma de 'oreja' cubiertas por azucar, precio por docena.",
                     price:4000
              },
              {
                     name: "Mandoca",
                     description: "Masa de maiz dulce frita, precio por docena.",
                     price: 3000
              },
              {
                     name: "Pastel de calabaza",
                     description: "Pastel hecho de una mezcla de bizcocho tradicional y calabaza",
                     price: 7000
              },
              {
                     name: "Golfeado",
                     description: "El golfeado es un pan dulce típico de la gastronomía de Venezuela, originario de la Región Capital del país, especialmente de la zona de los Altos Mirandinos, en particular de Carrizal, precio por unidad.",
                     price: 3000
              },
              {
                     name: "Pan de guayaba",
                     description: "El pan de guayaba es un pan dulce horneado relleno de una jalea de fruta(guayaba) endulzada, precio por unidad.",
                     price: 2000
              },
              {
                     name: "Brownie",
                     description: "El brownie es un bizcocho de mezcla de chocolate con trozos de chocolate, precio por unidad",
                     price: 1500
              },
              {
                     name: "Chip Cookies",
                     description:"Galleta con receta tradicional de una masa compuesta de mantequilla con azúcar marena y azucar blanca con trozos de chocolate semi-dulces, precio por docena",
                     price: 5000
              },
              {
                     name: "Cheesecake",
                     description: "Tarta con fondo de galleta crujiente rellena de queso crema",
                     price: 7000
              },
              {
                     name: "Pie de limon",
                     description: "El pie de limon es una tarta formada por una base de masa de hojaldre que se rellena con crema de limón y es cubierta por merengue",
                     price: 7000
              }
       ]
)