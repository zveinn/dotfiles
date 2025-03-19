package main

import (
	"fmt"
	"io/fs"
	"os"
	"path/filepath"
)

func main() {
	filepath.WalkDir(".", func(path string, d fs.DirEntry, err error) error {
		fmt.Println(path)
		return nil
	})
	os.Exit(0)
}
