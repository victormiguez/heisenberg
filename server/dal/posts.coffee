sql   = require 'mssql'
Post  = require "../models/post"

class Posts
  getById: (id, done) ->
    sql.connect configConn, (err) ->
      request = new sql.Request()
      
      request.input 'id', sql.Int, id

      request.query 'select id, title, description from posts where id = @id', (err, recordset) -> 
        done recordset[0]
      return
    return

  getAll: (done) ->
    sql.connect configConn, (err) ->
      request = new sql.Request()
      
      request.query 'select id, title, description from posts order by id desc', (err, recordset) -> 
        done recordset
      return
    return

  save: (post, done) ->
    sql.connect configConn, (err) ->
      request = new sql.Request()

      request.input 'title', sql.VarChar, post.title
      request.input 'description', sql.VarChar, post.description

      request.query 'insert into posts (title, description) output inserted.id values (@title, @description)', (err, recordset) ->
        if err is undefined
          done err, recordset[0]["id"]
        else        
          done err
      return
    return

  update: (id, post, done) ->
    sql.connect configConn, (err) ->
      request = new sql.Request()

      request.input 'id', sql.Int, id
      request.input 'title', sql.VarChar, post.title
      request.input 'description', sql.VarChar, post.description

      request.query 'update posts set title = @title, description = @description where id = @id', (err) ->
        done err
      return
    return

  delete: (id, done) ->
    sql.connect configConn, (err) ->
      request = new sql.Request()

      request.input 'id', sql.Int, id

      request.query 'delete from posts where id = @id', (err) ->
        done err
      return
    return

module.exports = Posts