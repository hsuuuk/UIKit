// 🥕
session.dataTask(with: requestURL) { data, response, error in
    
    guard error == nil else { return }
    
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    let successRange = 200..<300
    guard successRange.contains(statusCode) else { return }
    
    guard let data = data else { return }
    
    do {
        let decoder = JSONDecoder()
        let newData = try decoder.decode(DecodedData.self, from: data)
        self.musciArr = newData.results
        
        DispatchQueue.main.async {
            self.label.text = self.musciArr.first?.albumName
            self.loadImage()
        }
    }
    catch {
        print("error: " + error.localizedDescription)
    }
} .resume()

// 🥕🥕
session.dataTask(with: requestURL) { data, response, error in
    
    guard let data = data, let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode, error == nil else { return }
    
    do {
        let decoder = JSONDecoder()
        let newData = try decoder.decode(DecodedData.self, from: data)
        self.musciArr = newData.results
        
        DispatchQueue.main.async {
            self.label.text = self.musciArr.first?.albumName
            self.loadImage()
        }
    }
    catch {
        print("error: " + error.localizedDescription)
    }
} .resume()

// 🥕🥕🥕
session.dataTask(with: requestURL) { data, response, error in
    
    guard let data = data, let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode, error == nil else { return }
    
    let decoder = JSONDecoder()
    guard let newData = try? decoder.decode(DecodedData.self, from: data) else { return }
    self.musciArr = newData.results
    
    DispatchQueue.main.async {
        self.label.text = self.musciArr.first?.albumName
        self.loadImage()
    }
} .resume()

// 🥕🥕🥕🥕
session.dataTask(with: requestURL) { data, response, error in
    
    guard let data = data, error == nil else { return }
    
    let decoder = JSONDecoder()
    guard let newData = try? decoder.decode(DecodedData.self, from: data) else { return }
    self.musciArr = newData.results
    
    DispatchQueue.main.async {
        self.label.text = self.musciArr.first?.albumName
        self.loadImage()
    }
} .resume()
