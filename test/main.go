package main

import (
	"fmt"
	"io/fs"
	"os"
	"path/filepath"
	"strings"
)

func main() {
	filepath.WalkDir(os.Args[1], func(path string, d fs.DirEntry, err error) error {
		if strings.Contains(path, "node") {
			return filepath.SkipDir
		}
		if strings.Contains(path, ".git") {
			return filepath.SkipDir
		}
		fmt.Println(path)
		return nil
	})
}
