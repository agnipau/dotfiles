function tsconfig
    echo >tsconfig.json '{
  "compilerOptions": {
    "outDir": "dist",
    "strict": true,
    "lib": ["ESNext", "DOM"],
    "sourceMap": true
  }
}
'
end

