import { OnInit, Component } from '@angular/core';
import { Router } from '@angular/router';
import { ViewCell } from 'ng2-smart-table';

@Component({
	styleUrls: ['customer-image.component.scss'],
	templateUrl: 'customer-image.component.html',
})
export class CustomerImageComponent implements ViewCell, OnInit {
	value: any;
	rowData: any;
	imageUrl: string;
	redirectPage: string;

	constructor(private readonly router: Router) {}

	ngOnInit() {
		this.imageUrl = this.rowData.image;
	}

	redirect() {
		if (this.redirectPage) {
			this.router.navigate([`${this.redirectPage}/${this.rowData.id}`]);
		}
	}
}
