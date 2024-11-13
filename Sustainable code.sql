-- Create CropTypes Table
CREATE TABLE CropTypes (
	CropTypeID INT PRIMARY KEY,
	CropTypeName VARCHAR(100) NOT NULL
);

-- Create Farmers Table
CREATE TABLE Farmers (
	FarmerID INT PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Location VARCHAR(255),
	ContactInfo VARCHAR(100)
);
-- Create Plots Table
CREATE TABLE Plots (
	PlotID INT PRIMARY KEY,
	FarmerID INT NOT NULL,
	Size FLOAT,
	Location VARCHAR(255),
	FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID)
	ON DELETE CASCADE
);


