# Cool vim demo

```go
key := 5
text := "Hello, world!"
for i := 0; i < len(text); i++ {
    encoded = key + text[i]
}
```

1. select inside assignment
2. change surroundings -> function 
3. go to word
4. change surroundings -> function

```go
key := 5
text := "Hello, world!"
for i := 0; i < len(text); i++ {
    encoded = rune(key + int(text[i]))
}
```