var express = require("express")
var mysql = require("mysql")
var app = express()

app.use(express.json())

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'shop'
})

//connexion a la base de donnees
con.connect((err)=>{
    if(err)
    {
        console.log(err)
    }else{
        console.log('Success');
    }
})


app.get('/', (req, res)=>{
    res.send('Bonjour Fercia');
})

//lister les chausssures de la BD
app.get('/api/chaussures', (req, res)=>{
    
    con.query('SELECT * FROM chaussures',(err,result)=>{
        if(err) res.status(500).send(err)
        
        res.status(200).json(result)
    })
})

app.get('/api/marques', (req, res)=>{
    
    con.query('SELECT * FROM marques',(err,result)=>{
        if(err) res.status(500).send(err)
        
        res.status(200).json(result)
    })
})


app.get('/api/get/:id', (req, res)=>{
    
    con.query('SELECT * FROM chaussures WHERE id_chaussure=?',[req.params.id_chaussure],(err,result)=>{
        if(err) res.status(500).send(err)
        
        res.status(200).json(result)
    })
})


app.post('/api/chaussures', (req, res)=>{
    const id_Marque = req.body.id_Marque;
    const taille = req.body.taille;
    const couleur = req.body.couleur;
    const prix = req.body.prix;
    const nom_chaussure = req.body.nom_chaussure;

    
    con.query('INSERT INTO chaussures VALUES(NULL,?,?,?,?,?)',[id_Marque,taille,couleur,prix,nom_chaussure],(err,result)=>{
        if(err)
    {
        console.log(err)
    }else{
        res.send('POSTED');
    }
    })
})

//Ajouter une marque

app.post('/marques/post', (req, res)=>{
    const marque = req.body.marque;
    const logo = req.body.logo;

    
    con.query('INSERT INTO marques VALUES(NULL,?,?)',[marque,logo],(err,result)=>{
        if(err)
    {
        console.log(err)
    }else{
        res.send('POSTED');
    }
    })
})

app.listen(3003, (err)=>{
    if(err)
    {
        console.log(err)
    }else{
        console.log('on port 3003');
    }
})