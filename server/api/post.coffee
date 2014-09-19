Post = require "../models/post"
posts = new (require "../dal/posts")

# GET
exports.posts = (req, res) ->
  posts.getAll (data) ->
    res.json data

exports.post = (req, res) ->
  id = req.params.id

  posts.getById id, (data) ->
    res.json data

# POST
exports.add = (req, res) ->
  post = new Post req.body

  posts.save post, (err) ->
    if err is undefined
      res.json post
    else
      res.status(500).send(err)

# PUT
exports.edit = (req, res) ->
  id = req.params.id
  post = new Post req.body

  posts.update id, post, (err) ->
    if err is undefined
      res.json post
    else
      res.send 500, err

# DELETE
exports.delete = (req, res) ->
  id = req.params.id

  posts.delete id, (err) ->
    if err is undefined
      res.json true
    else
      res.send 500, err