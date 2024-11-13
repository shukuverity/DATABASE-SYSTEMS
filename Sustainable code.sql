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
-- Create Crops Table
CREATE TABLE Crops (
	CropID INT PRIMARY KEY,
	PlotID INT NOT NULL,
	CropTypeID INT NOT NULL,
	PlantingDate DATE,
	HarvestingDate DATE,
	IsDiversified BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (PlotID) REFERENCES Plots(PlotID)
	ON DELETE CASCADE,
	FOREIGN KEY (CropTypeID) REFERENCES CropTypes(CropTypeID)
	ON DELETE CASCADE
);
-- Create Practices Table
CREATE TABLE Practices (
	PracticeID INT PRIMARY KEY,
	PlotID INT NOT NULL,
	PracticeType VARCHAR(100) NOT NULL,
	StartDate DATE,
	Description TEXT,
	FOREIGN KEY (PlotID) REFERENCES Plots(PlotID)
	ON DELETE CASCADE
);
-- Create SoilHealthMonitoring Table
CREATE TABLE SoilHealthMonitoring (
	MonitoringID INT PRIMARY KEY,
	PlotID INT NOT NULL,
	MonitoringDate DATE NOT NULL,
	SoilPH FLOAT,
	OrganicMatter FLOAT,
	ErosionLevel VARCHAR(50),
	Notes TEXT,
	FOREIGN KEY (PlotID) REFERENCES Plots(PlotID)
	ON DELETE CASCADE
);
-- Create Profit Table
CREATE TABLE Profit (
	ProfitID INT PRIMARY KEY,
	PlotID INT NOT NULL,
	Year INT NOT NULL,
	Revenue FLOAT NOT NULL,
	Cost FLOAT NOT NULL,
	Profit FLOAT GENERATED ALWAYS AS (Revenue - Cost) STORED,
	FOREIGN KEY (PlotID) REFERENCES Plots(PlotID)
	ON DELETE CASCADE
);
-- Create Yield Table
CREATE TABLE Yield (
	YieldID INT PRIMARY KEY,
	PlotID INT NOT NULL,
	CropID INT NOT NULL,
	Year INT NOT NULL,
	TotalYield FLOAT NOT NULL,
	FOREIGN KEY (PlotID) REFERENCES Plots(PlotID)
	ON DELETE CASCADE,
	FOREIGN KEY (CropID) REFERENCES Crops(CropID)
	ON DELETE CASCADE
);








